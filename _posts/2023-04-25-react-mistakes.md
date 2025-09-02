---
layout: blog
title: "An Interesting List of React Mistakes"
tags: tech
footnotes: true
code: true
---

Look, a list of simple things that you and your colleagues should know to avoid, but which you will still do by accident from time-to-time and eventually spend months of your life, in total, tracking down.

Don't worry, these are all a bit more interesting than React 101 stuff like "don't write conditional hooks".

<!--more-->

(Apologies for the syntax highlighter's occasionally bizarre understanding of TSX. Maybe I'll fix it someday.)

---------

## 1. `useEffect` with no deps array

As you may know, `useEffect` with an *empty* deps array runs once, on mount.

```tsx
useEffect(() => {
  // I'll run once, on mount.
  return () => {
    // and I'll run once, on unmount
  };
}, []);
```

And `useEffect` with *no* deps array runs on every render: 

```tsx
useEffect(() => {
  // I'll run every time you get re-rendered. Why? Nobody knows.
});
```

But even if you know this, you're going to mess it up occasionally. 

You probably know about it if you've read the docs like a good engineer, but it's going to come back to haunt you some day. It should be banned. It is a huge mistake in the API that this exists. As you remove elements from the dep array it rerenders _less_ often... but when you remove the array it rerenders _always_. Seems wrong. "Taking dependencies away" should always cause the function to run more rarely and it should do so monotonically. I'd bet money that in ten years `useEffect` will be called `DEPRECATED_useEffect()` after having been split up into a few smaller hooks that have fewer footguns. Mainly this one, but also for a few other reasons...

----------

## 2. `useEffect` with listeners

A common use of `useEffect` is to set up a listener manually.

```tsx
useEffect(() => {
  const keydown = () => { /* whatever */ };
  document.addEventListener('keydown', keydown);
  return () => {
    document.removeEventListener('keydown', keydown);
  };
}, []);
```

(Why are you doing this? Because perhaps you need to capture keybindings on the whole page, not just on children of the component you're rendering, but perhaps you don't have an abstraction for handling that because for some reason React doesn't provide a default one. And in fact you don't actualy care if this happens during the render or after the render, so you'd rather use `useMemo` for this, but it doesn't take a cleanup function so you don't.) 

But what if you want the listener to depend on some local variables? 

The React linter will tell you to make sure they’re all in the deps array, like this:

```tsx
useEffect(() => {
  const keydown = dispatch(someAction(someId));
  document.addEventListener('keydown', keydown);
  return () => {
    document.removeEventListener('keydown', keydown); 
  }
}, [dispatch, someId]);
  // ^^^^ silly, but at least we appeased the linter?
```

But now the listener is going to be being un-registered and re-registered whenever `someId` changes, even though that's completely pointless. In this case it is fairly innocuous, but it can combine with other weird situations and cause real bugs. Such as: sometimes you need listeners registered in a particular order for bubbling to work correctly (yes, unfortunate, but a common example is when both the page and a modal on the bind `Esc` keypresses and you want the modal to win the race). Another example: maybe the callback being registered in some other module that does non-trivial work on subscription, such as making a server call for a subscription token.

There are several solutions to this, but they all suck:

- live with the reregistration (bad)
- save your variables on refs so they aren't in the deps (gross)
- write a `useStableRef` hook to save variables on refs more ergonomically (less gross, but still gross)
- invent a `useMemoizedEffect()` hook that takes two deps arrays and does the tracking under the hood (gross but cool I guess)
- ignore the lint rule ← do this. The lint rule is dumb.

I believe that `useEffect`'s deps array concept is kinda broken. It really ought to let you manually tell it when the effect should to re-run, but it doesn’t, so you have to work around it somehow.

My preferred solution is to completely ignore the deps array linter---either turn it off entirely, or turn it off on one line with `/* tslint:disable */`, or just ignore it. Anyway in practice it seems like half of the deps arrays I write are intentionally different from what the linter wants, because once you're a moderately-sophisticated hooks user, you _know_ when you want every hook to re-render, and it is not exactly the same as when their syntactic dependencies change. 

Of course, the trick is making sure everyone on your team is okay with this, and does it correctly. Which isn't great either and suggests that the deps array concept is fundamentally broken. Now I love hooks in general (they're better than any *other* way of writing UI), but there is something glaringly wrong with them still, and the solution is something that hasn't come yet.

---------

## 3. `useEffect` in general

It was never quite clear, anyway, what `useEffect` is supposed to do.

Yes, it's something that should happen when a component re-renders, a "side-effect", hence the name. But the API and the Linter together make it clear that the intention is that effects should happen whenever the relevant props change, so it's expressing the concept of specifically a "side-effect *of props changing*", which is a code-level construct, that is, an implementation detail. And then there's the no-deps-array version which does a different thing: it runs on every render and implements a "side-effect of rendering".

But what you almost always need is a third thing entirely: "a side-effect in *business-logic*". That is: "when *certain* props `[x,y]` change, do a particular thing (whose specification has nothing to do with that `x` or `y`, necessarily)". In this case the "exhaustive deps" lint rule is basically always wrong, and, as above, I think the best solution in 2023 is to just ignore it. You should understand which type of effect you're writing and then write it whole-heartedly, and if that means disabling the linter, so be it.

The real Gotcha here, though, is that you will waste a bunch of time *arguing* with other developers about what a proper `useEffect` is, and whether the exhaustive-deps lint rule is correct, and whether some particularly egregious violation of it is okay. When in fact `useEffect` is a badly-conceived API and you should just ignore it and do exactly what you need it to do, with the understanding that it is one API trying to be three things at once.

To summarize:

`useEffect` does three things at once:

1. a side effect of props changing in code (something is invalidated when a particular prop changes and has to be updated)
2. a side effect of a render (something needs to happen right after a render, such as imperatively interacting with HTML)
3. a side effect of business logic (props changed -> new code needs to run)

There is _no good hook_ in React for (3), so we use `useEffect`, and if that's what you need, just fucking do it and break the rules. The deps array in that case should reflect _the actual deps of the business logic_, rather than the deps of the literal code in the `useEffect` block.

----------

## 4. Forgetting `DisplayName`

Set `displayName` on Function components so they have useful names in React Devtools:

```tsx
const Fc: React.FC = () => { /* whatever */ };
Fc.displayName = "Fc";
```

More importantly: do this before you need it. It’s nice when everything in devtools has a name. But in particular, it's nice if things have names in prod, _before you need them_... because there will eventually be a bug that you can't reproduce easily on your non-minified development code code, so you'll want to point React Devtools at Prod, and it will be _really_ nice if this is already done.

If you write higher-order components (which you shouldn't have to do because we have hooks now, but whatever) you should give them good names also:

```tsx
const SomeHOC = (component) => { 
  const wrapped = () => { /* whatever */ };
  wrapped.displayName = `SomeHOC(${component.displayName})`;
};
```

By the way, you _could_ avoid needing `displayName` by defining your components with `function` instead of as `const` array functions, because Javascript has an, um, easter egg that `function foo()` becomes an object which, besides being callable, also has a field called `name` on it with value `'foo'`. Weird, right? 

But we disprefer the use of `function foo()` for two reasons: (a) we prefer to just always use arrow functions because regular functions should be deleted from the language probably, and in particular (b) with `function` you can't specify the `React.FC<Props>` type on the same line, and those types are very useful for e.g. catching that you forgot to return a valid component value (`ReactElement | null`) from a branch in the function body. So the better policy is to just use arrow functions always, but set `displayName`. Hopefully someday Javascript or Typescript will automatically be able to use variable names as `displayName`s without having to do this.

----------

## 5. `useState` with callbacks

Every once in a while you find yourself needing to store a callback in local state (maybe it is being registered from a child component). You’ll screw it up the first time you do it, though:

```tsx
type CallbackType = () => void;
const [callback, setCallback] = useState<CallbackType | null>(null);

// lalala, writing code on autopilot
setCallback(() => console.log("callback"));
```

See the problem?

Allow me to remind you of the (effective) type signature of `useState`:

```tsx
useState<S>(initialState: (() => S) | S): [S, (update: T | (prev: T) => T) => void]
```

Specifically, the signature of the second element of the return value:

```tsx
(update: T | (prev: T) => T) => void
```

That is, it takes *either* a `T` or a reducer function `(prev: T) => T)`, which takes an old `T` and produces a new `T`. Internally it checks if the argument is a function using something roughly equivalent to `typeof arg === 'function'`, and if so it _calls it_. So you actually need to write 

```tsx
setCallback(() => () => console.log("callback"));
```

Even though it's obvious once you think about it, it is super easy to forget in practice. When it does come up, I’d recommend to either:

* wrap `setCallback` in another function which ensures this is done and makes the type not ambiguous
* or write a new hook that's a thin wrapper around `useState` and ensures you don't screw it up.

----------

## 6. `React.memo` and prop spreads

Sometimes you have a bucket of props which you want to spread onto a subcomponent:


```tsx
type WrapperProps = ChildProps & { important: string; }
const Wrapper: React.FC<WrapperProps> = (props) => {
  const {important, ...rest} = props;
  return <Child {...rest} />;
}
```

And perhaps the `<Child>` component is memoized:

```tsx
const Child: React.FC<ChildProps> = React.memo(() => { /* .. */ });
```

This can break in a weird and subtle way.

It turns out that, *only* when spreading props, Typescript/TSX will allow you to put props onto a child that it **doesn’t actually have in its prop type**. And it turns out that, although these props are ignored, they **do prevent memoization**. Sigh. Guess how I found that out.

So what can happen is this unfortunate sequence of events:

1. Originally, the child props list is small and immutable, so the child never updates.
2. Later on, the wrapper is given a new prop -- perhaps `unimportant: string` -- that it doesn't unwrap in the spread. (Or perhaps the `important` prop is no longer used but someone forgets to remove it from the type. This happens more easily if the wrapper is conforming to some shared type for an injectable component, so usually it's going to be in a larger and more abstractified codebase than your React starter app).
3. It will then include that prop on `<Child>`, and this will typecheck, and it will look totally fine
4. ...but now `<Child>` can rerender constantly based on changes to a prop that it doesn't even *have in its definition*.

And sometimes that `React.memo()` call is doing a lot of work, such as if the spread is a long list of mostly unchanging props, and when suddenly fails it might start some catastrophic re-rendering.

It sounds like a rare case, and it is, but it's so elusive when it happens that it's worth being aware of. In a way it goes to show the danger of spreading props (and of using weird component abstractions like this... but sometimes it is the best choice). It is often better, if you can, to include the `childProps` as a _single_ prop rather than part of the top-level props of `Wrapper`, like this:

```tsx
type WrapperProps = {
    important: string;
    childProps: ChildProps;
}
```

Such that your `<Child>` component receives a list that explicitly has the same type as its actual props list:

```tsx
return <Child {...childProps} />;
```

----------

## 7. Accidentally redefining components

Spot the bug:

```tsx
const SomeComponent: React.FC = ({userId, ...rest}) => {
  const PartialChild = (rest) => <Child userId={userId} {...rest} />;
  return <SomeWrapper ChildComponent={PartialChild} />
}

const SomeWrapper: React.FC = ({ChildComponent}) => {
  /* ... */
  return <ChildComponent />;
}
```

This was an attempt to construct a component, to be passed into a child for rendering, that had some of its props "pre-filled out" (in the example, `userId`). 

It’s a rare pattern but not entirely unheard of: sometimes a library will take a component that it’s supposed to use to render some UI, and it has a certain props list it expects, but you need it to depend on some other stuff also. But this is not the right way to do it.

The problem is that, any time this parent component updates, everything that uses `PartialChild` will re*mount* rather than re*render*. This is because `PartialChild` is returning a brand new function, every time. The reason is that the way React determines whether a component "is the same component" and should rerender instead of remounting is by checking _both_:

1. if the `key` is unchanged, where `key` is the thing we all know from making list components 
2. if the `type` is unchanged, where `type`  is “the class or function or string which defines the JS tag”

Everybody knows about (1)... and most people have never thought about (2). Why would they? Function components are normally always top-level declarations so there’s only one function object for them, ever, and it's just re-used everywhere the component is used. 

But if you declare the component itself inside *another* component, it will be a brand new component whenever that code re-runs (because functions are compared by identity, not equivalency---the same reason that an inline no-op function like `() => {}` breaks memoization) is recomputed. So it will re-mount, from scratch, every time that code runs.

It should go without saying that remounting when you intend to render is bad, for simple reasons like "it erases all your state".

You also can’t totally avoid the problem by memoizing the child component:

```tsx
const Component: React.FC = ({userId, ...rest}) => {
  const MemoizedChild = React.useMemo(
    () => (rest) => <Child userId={userId} {...rest} />, 
    [userId]
  );
  return <SomeWrapper ChildComponent={MemoizedChild} />;
}
```

This has the same problem, although less often: now it only when `userId` changes, which is an improvement at least. But in practice it will often depend on more props that change more frequently. And anyway, you really never want anything to remount for any reason. It breaks a lot of stuff when it happens unexpectedly.

The real solution is to zoom out a bit: it’s almost never what you want to remount a component of the same type in the same place, and if it was, you should have explicitly changed the `key` prop to indicate that. The better solution, at least if you have the option of changing `<SomeWrapper>`, is to use a regular lower-case function as the prop that’s not a component:

```tsx
const Component: React.FC = ({userId, ...rest}) => {
  const PartialChild = (rest) => <Child userId={userId} {...rest} />;
  return <SomeWrapper childComponent={PartialChild} />; // note the lower-case "c"
}

const SomeWrapper: React.FC = ({childComponent}) => {
  /* ... */
  return childComponent(); // a function call, not a JSX constructor
}
```

This always memoizes just fine. But `<SomeWrapper>` will have to be updated internally to call `child(props)` instead of `<Child {...props} />`. This might be a problem if you don't control that code.

As you can see, passing component definitions around as capital-letter props should be considered an antipattern. Nevertheless I've come across it occasionally, especially in older React code before the modern idioms became established, or in code written by otherwise talented engineers who were new to React.

------

## 8. Rerendering during animations

You should generally not trigger component rerenders on every frame of an animation. No, actually, you should _never_ do it.

You may get away with it in small hobby apps and so think it is fine, and sometimes React tutorials will even do it to demonstrate how things work. But in a, uh, production-quality codebase, it's a bad idea. It will fry the performance of anything else that is going on at the same time. But the real Gotcha is that it will probably look fine on _your_ machine because you're using an M1/M2 mac or whatever, but it will look a *lot* worse on your users' weaker machines. So don't do it.

In fact the reason I have this on my list at all is that, by complete accident, at my last job I was one of the last engineers to get a pre-M1 mac, while the rest of my team had the newer ones. Which sounds annoying and it is occasionally, but it also meant that I could actually find a bunch of the performance problems on our website (the Dropbox homepage) that nobody else was seeing.

It's also just a bad practice, even if it is smooth. You would not _intentionally_ choose to run a ton of code on any frame of a 30 fps animation. But if you're triggering-rerenders... well, take a look at Devtool's performance traces during an animation. Triggering React re-renders on every animation frame causes a _lot_ of code to get run, all at once, at a time when you would specifically like the animation to proceed smoothly. This code runs fast on your machine, _for now_, but when it gets more complicated, or when you run the same code on other people's computers (or phones!), the animation will stutter and glitch around, and their CPU fan will start spinning, because the React render loop is running so much code that it's basically maxing out a CPU for the entire 16ms of each frame. So, again, just don't do it.

If possible, animation should be entirely handled via CSS. But when it can't be, it's still okay to do it in JS. The trick is to do it all imperatively, without ever triggering a React state update. The basic technique looks like this:

1. Set up a `ref` for any component that is going to be animated.
2. Manually update `ref.current.style` on each frame, which triggers the browser repainting, but doesn't trigger React re-rendering.[^css]
3. Perform state updates only at the start and end of the animation.
4. If the style updates get complicated, or involve many sub-components, use `useImperativeHandle` to abstract out functionality on each of the relevant subcomponents so they can handle their own animated styling.

[^css]: (Unless, god forbid, you have something listening to the CSS changes... such as `IntersectionObserver`. Pro-tip: don't use `IntersectionObserver` unless you absolutely have to, and if you do, be _very careful_. It's incredibly easy to trigger infinite loops of re-renders with it).

This is all a pain, of course. But it's a lot better to realize it's a pain up front and implement the component right the first time, rather than implement it once, realize it lags, and then refactor and rewrite the whole thing to do it right. Promise.

I do think that in a perfect world you would be able to smoothly animate via React rerenders, but in my experience it really just doesn't work right now. Maybe there are tricks I don't know about or something.

By the way, don't forget that this applies also to user-triggered events that run on every frame, such as:
* dragging components
* triggering `mousemove` events
* resizing the window, or resizing components
* arguably, typing, but you might get away with it.[^substack]

[^substack]: Although seriously, don't press your luck. I am SO TIRED of shitty websites that lag on keypresses because they trigger massive re-renders on every frame. I'm talking about you, Substack, and your literally-unusable comment section.

None of these should ever trigger state updates on every frame. State updates on specific breakpoints, such as when you resize the window smaller than a certain size or when you move the mouse into a certain region, are fine, as long as they won't thrash (e.g. if they're triggered when the mouse is on the border, then they'll fire in a loop if the user leaves the mouse there for a long time). But on every frame, that's an antipattern.

Look, you don't have to listen to me. Script your animations with React state updates for all I care. But I will just say: in engineering, the point of best practices is to fix bugs by never writing them in the first place. So you may as well do the gritty work now instead of later.

----------

## 9. Redux

Don’t use Redux. Use Recoil or Jotai or something. Thank me later. 

Why? Well, this is contentious, I guess. But I don't think Redux scales correctly for large multi-module codebases.

The problem is that it becomes unclear whose job it is to set up or populate parts of the store. You run into cases where components mount that expect a slice of the store to (a) exist, (b) have its reducers and middleware aready set up, and (c) have its state pre-populated with the correct values. But the components don't have a way of _forcing_ that to happen, so they instead have to just assume it's been done already... and usually it does, except when it occasionally doesn't, and then you've managed to reinvent race conditions in a single-threaded language.

Whatever the right idiom for safe Redux usage is, it has to basically involve components atomically setting up whatever parts of the store they need if it's not already there, so that everything can render whenever it feels like without worrying about what other code has already run. I'm not aware of a library that does this.

The other problem with Redux is that it puts developers in an "all you have is a hammer so everything looks like a nail" situation, vis-à-vis state management. Since it's so easy to put any moderately global state into Redux, you do, and you end up with things that should be local to a particular subtree or 'slice' of the app going through the global reducer chain and triggering every `useReducer()` in the whole app to re-run. Using `React.Context`, which will only update its explicitly subscribed children when it explicitly changes, will be much more efficient for anything that updates quickly or needs fast feedback.

(If you’re still using class components, keep in mind that `mapStateToProps` is run on every subscribed component on every store update. In large apps there can be easily hundreds of store updates on loading (which is a bad idea but what can you do), so if `mapStateToProps` does anything non-trivial you pay the cost hundreds of times. So ideally you might want this to just do something dumb (‘extract a few props’) rather than something complicated (‘massage every prop into the form you want it in’). Although, tbh, if you try to memoize class components with Redux involved you’re just going to have a bad time no matter what.)

Especially egregious is using Redux to orchestrate UI feedback that happens on the frame-level, such as animation or just having buttons be very responsive. If you want something to be snappy, don't call `dispatch()` and wait for it to finish. You'd be running potentially many thousands of lines of code to do something quickly! Why?! Stop it!

IMO a good rule of thumb is that Redux actions should be 1:1 with state changes that rebuild the UI in a non-trivial way, since those _necessarily_ involve many components being aware of the update and having the chance to respond to it. For everything else, you can use Contexts.

-------

## 10. Logging in Redux

While I'm on the subject: if you do use Redux, definitely _don't_ do your logging with it. It will never be the case that the list of Redux actions is the same, or even necessarily similar to, the list of events you want to log. Even if it was in the Redux sample app. Logging in Redux just pollutes everything -- the Redux action list, the reducer list, the number of Redux actions that you might have to step through in the debugger -- for no benefit, really. It takes something that's otherwise easy to read and splays it out into a mess of indirection (although arguably that's what Redux always does, lol).

Instead, either pass a `Logger` object around anywhere you need it, and maybe set up a global `React.Context` with your logger in it and let any component grab it from there. I generally think you shouldn’t use middleware at all, just a store + reducers, but some people are bound to disagree.

{% include thickrule.html %}

Okay, that's my list.

After all that, I should probably mention that I do love React. React is great. It would be foolish to not use it or something like it for web development in 2023. I don't think it's the final library we'll be using to build interfaces on starships in 100 years, or whatever, but it's better than everything that came before it, and the future of application development will probably come in the form of looking *more* Reacty, not less. Or rather, it'll come in the form of better-delivering on React's promises than React already does, for instance by not having these landmines everywhere.

{% include react.html %}