---
layout: blog
title: "React Gotchas"
tags: tech
---

More notes on React.js, from the trenches of my former job: the simple things that you and your colleagues need to not do in (modern) React but which you will still do by accident from time-to-time and eventually spend weeks of your life, in total, tracking down. Don't worry, these are all a bit more interesting than React 101 stuff like "don't write conditional hooks".

<!--more-->

(Apologies for the syntax highlighter's occasionally bizarre understanding of TSX. I'll fix it when I get the chance.)

---------

## 1. `useEffect` with no deps array

`useEffect` with an *empty* deps array runs once, on mount.

```tsx
useEffect(() => {
    // I'll run once, on mount.
    return () => {
    // and I'll run once, on unmount
    };
}, []);
```

But `useEffect` with *no* deps array runs on every render: 

```tsx
useEffect(() => {
    // I'll run every time you get re-rendered. Why? Nobody knows.
});
```

You almost never want this! It should be banned. Seriously, it is a huge mistake in the API that this exists. You probably know about it if you've read the docs like a good engineer, but nevertheless it's going to come back to haunt you some day. I'd bet money that in ten years `useEffect` will be called `DEPRECATED_useEffect()` after having been split up into a few smaller hooks that have fewer footguns. Mainly this one, but also for a few other reasons...


----------

## 2. `UseEffect` with listeners

A common use of `useEffect` is to set up some listener manually.

```tsx
useEffect(() => {
    const keydown = () => { /* whatever */ };
    document.addEventListener('keydown', keydown);
    return () => {
        document.removeEventListener('keydown', keydown);
    };
}, []);
```
(You'd rather use `useMemo`, because you often don't care that this happens after render, but it doesn't take a cleanup function so you don't.) 

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

Now the listener is constantly being un-registered and re-registered whenever `someId` changes, even though that's completely pointless. In this case it is fairly innocuous, but it can combine with other weird situations and cause real bugs. Such as: needing listeners registered in a particular order for bubbling to work correctly, or the callback being registered in some other module that does non-trivial work on subscription (such as a server call for a subscription token).

Several solutions:

- live with it (gross)
- save your variables on refs (gross)
- use a `useStableRef` hook to save variables on refs more ergonomically (less gross, but still gross)
- invent a `useMemoizedEffect()` hook that takes two deps arrays and does the tracking under the hood (gross but cool I guess)
- ignore the rule ← do this. The rule is dumb.

Basically, `useEffect`'s deps array concept is kinda broken. It really ought to let you manually tell it when to re-run, but it doesn’t, so you have to work around it somehow.

My preferred solution is to completely ignore the deps array linter -- either turn it off entirely, or turn it off on one line with `/* tslint:disable */`, or just ignore it. In practice it seems like half of the deps arrays I write are intentionally different from what the linter wants, because once you're a moderately-sophisticated hooks user, you _know_ when you want every hook to re-render, and it is not exactly the same as when their syntactic dependencies change. 

Of course, the trick is making sure everyone on your team is okay with this, and does it correctly. All of this suggests that the concept is fundamentally broken. I love hooks, in general (they're better than any *other* way of writing UI), but there is something glaringly wrong with them still, and the solution is something that hasn't come yet.


----------

## 3. Forgetting `DisplayName`

Set `displayName` on Function components so they have useful names in React Devtools:

```tsx
const Fc: React.FC = () => { /* whatever */ };
Fc.displayName = "Fc";
```

More importantly: do this before you need it. It’s nice when everything in devtools has a name. In particular, it's nice if things have names in prod because there will eventually be a bug that you can't reproduce easily on your non-minified code, so you'll want to point React Devtools at Prod, and it will be _really_ nice if this is already done.

If you write higher-order components (which you shouldn't have to do because we have hooks now, but whatever) you should give them good names also:

```tsx
const SomeHOC = (component) => { 
    const wrapped = () => { /* whatever */ };
    wrapped.displayName = `SomeHOC(${component.displayName})`;
};
```

By the way, you could avoid needing `displayName` by defining your components with `function` instead of as `const` array functions, because Javascript has an, um, easter egg that `function foo()` becomes an object which, besides being callable, also has a field called `name` on it with value `'foo'`. Weird, right? But we don't prefer to do that because (a) we prefer to just always use arrow functions because regular functions should be deleted from the language probably, and (b) you can't specify the `React.FC<Props>` type on the same line, and those types are very useful for e.g. catching that you forgot to return a valid value (`ReactElement | null`) from a branch in the function body.

----------

## 4. `useState` with callbacks

Every once in a while you find yourself needing to store a callback in local state. You’ll screw it up the first time, though:

```tsx
type CallbackType = () => void;
const [callback, setCallback] = useState<CallbackType | null>(null);

// lalala, writing code on autopilot
setCallback(() => console.log("callback"));
```

See the problem?

Allow me to remind you that the second component in `useState`’s return value is a function with signature 

```tsx
(update: T | (prev: T) => T) => void
```

That is, it takes *either* a `T` or a reducer function (which takes an old `T` and produces a new `T`). So you actually need to write 

```tsx
setCallback(() => () => console.log("callback"));
```

Even though it's obvious once you think about it, it is super easy to forget in practice. When it does come up, I’d recommend to either:

* wrap `setCallback` in another function which ensures this is done and makes the type not ambiguous
* or write a new hook that's a thin wrapper around `useState` and ensures you don't screw it up.

----------

## 5. `React.memo` and prop spreads

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

It turns out that, *only* when spreading props, Typescript/TSX will allow you to put props onto a child that it doesn’t actually have in its prop type. And it turns out that, although these props are ignored, they *do* break memoization. Sigh.

So what can happen is this unfortunate sequence of events:

1. Originally, the child props list is small and immutable, so the child never updates.
2. Later on, the wrapper is given a new prop -- perhaps `unimportant: string` -- that it doesn't unwrap in the spread. (Or perhaps the `important` prop is no longer used but someone forgets to remove it from the type. This happens more easily if the wrapper is conforming to some shared type for an injectable component, so usually it's going to be in a larger and more abstractified codebase than your React starter app).
3. It will then include that prop on `<Child>`, and this will typecheck, and it will look totally fine
4. ...but now `<Child>` can rerender constantly based on changes to a prop that it doesn't even *have in its definition*.

And sometimes that `React.memo()` call is doing a lot of work, such as if the spread is a long list of mostly unchanging props, and when suddenly fails it might start some catastrophic re-rendering.

It sounds like a rare case, and it is, but it's so elusive when it happens that it's worth being aware of. In a way it goes to show the danger of spreading props (and of using weird component abstractions like this... but sometimes it is the best choice). It is often better, if you can, to include the `childProps` as a _single_ prop rather than part of the top-level props of `Wrapper`:

```tsx
type WrapperProps = {
    important: string;
    childProps: ChildProps;
}
```

----------

## 6. Accidentally redefining components

Spot the bug:

```tsx
const SomeComponent: React.FC = ({userId, ...rest}) => {
    const PartialChild = (rest) => <Child userId={userId} {...rest} />;
    return <SomeWrapper childComponent={PartialChild} />
}
```

This was an attempt to construct a component, to be passed into a child for rendering, that had some of its props filled out (in the example, `userId`). It’s a rare pattern but not entirely unheard of: sometimes a library will take a component that it’s supposed to use to render some UI, and it has a certain props list it expects, but you need it to depend on some other stuff also. But this is not the right way to do it.

The problem is that, any time this parent component updates, everything that uses `PartialChild` will re*mount* rather than re*render*. This is because `PartialChild` is returning a brand new function, every time. The way React determines whether a component "is the same component" and should rerender instead of remounting is by checking both:

* if the `key` is unchanged, where `key` is the thing we all know from making list components.
* if the `type` if unchanged, where `type`  is “the class or function or string (for DOM elements) which defines the JS tag”.

Function components are normally always top-level declarations so there’s only one function object for them, ever, and it's just re-used everywhere the component is used. But if you declare the component itself inside *another* component, it will be a brand new component whenever that definition is recomputed, so it will re-mount, from scratch, every time that code runs. It should go without saying that remounting when you intend to render is bad, for simple reasons like "it erases all your state".

You also can’t totally avoid this by memoizing it:

```tsx
const Component: React.FC = ({userId, ...rest}) => {
    const MemoizedChild = React.useMemo(
        () => (rest) => <Child userId={userId} {...rest} />, 
        [userId]
    );
    return <SomeWrapper childComponent={MemoizedChild} />;
}
```

This has the same problem, although now only when `userId` changes, which is an improvement. But in practice it will often depend on more props that change more frequently.

The real solution is to zoom out a bit. It’s almost never what you want to remount a component of the same type in the same place, and if it was, you should explicitly change the `key` field to indicate that. The solution, if you have the option of changing `<SomeWrapper>`, is to use a regular lower-case function that’s not a component:

```tsx
const Component: React.FC = ({userId, ...rest}) => {
    const PartialChild = (rest) => <Child userId={userId} {...rest} />;
    return <SomeWrapper childComponent={PartialChild} />;
}
```

This always memoizes just fine. But `<SomeWrapper>` will have to be updated internally to call `child(props)` instead of `<Child {...props} />`.

As you can see, passing component definitions around as props should be considered an antipattern. Nevertheless I've come across it occasionally, especially in older React code before the modern idioms became established, or in code written by otherwise talented engineers who were new to React.

------

## 7. Rerendering during animations

You should generally not trigger component rerenders on every frame of an animation. It is kinda acceptable in small hobby apps, but in a, uh, production-quality codebase, it's a bad idea. It has a tendency to fry the performance of anything else that is going on at the same time, and to fry the performance of the page for people with weaker machines than yours. So don't do it.

It is fairly easy to see why this happens if you look at Devtool's performance traces during an animation. Triggering React re-renders on every animation frame causes a _lot_ of code to get run, all at once, during a time when you would really like the animation to proceed smoothly.

The weird 'gotcha' of this is that React developers will often be working on very fast machines, like M1/M2 Macbooks, so the animation will seem perfectly smooth _to them_ ... and then when you go see the same code run on other people's computers, the animation will stutter and glitch around, and their CPU fan will start spinning, because the React render loop is running so much code that it's basically maxing out CPUs for the entire 16ms of each frame. So just don't do it.

If possible, animation should be entirely handled via CSS. But when it can't be, it's still okay to do it in JS. The trick is to do it all imperatively, without ever triggering a React state update. The basic technique looks like this:

1. Set up a `ref` for any component that is going to be animated.
2. Manually update `ref.current.style` on each frame.
3. Perform state updates only at the start and end of the animation.
4. If the style updates get complicated, or involve many sub-components, use `useImperativeHandle` to abstract out functionality on each of the relevant subcomponents so they can handle their own animated styling.

This is all a pain, of course. I think that in a perfect world you would be able to smoothly animate via React rerenders, but in my experience it really just doesn't work right now. Maybe there are tricks I don't know about or something.

By the way, don't forget that this applies also to user-triggered events that run on every frame, such as:
* dragging components
* triggering `mousemove` events
* resizing the window, or resizing components
* arguably, typing, but you might get away with it.

None of these should ever trigger state updates on every frame. State updates on specific breakpoints, such as when you resize the window smaller than a certain size or when you move the mouse into a certain region, are fine though.

----------

## 8. Redux

Don’t use Redux. Use Recoil or Jotai or something. Thank me later. 

Why? Well, this is pretty contentious, I guess. But I don't think Redux scales correctly for large multi-module codebases.

The problem is that it becomes unclear whose job it is to set up or populate parts of the store. You run into cases where components mount that expect a slice of the store to (a) exist, (b) have its reducers and middleware aready set up, and (c) have its state pre-populated with the correct values. But the components don't have a way of _forcing_ that to happen, so they instead have to just assume it's been done already... and usually it does, except when it occasionally doesn't, and then you've managed to reinvent race conditions in a single-threaded language.

I'm not entirely sure what the right idiom for safe Redux usage is, but it has to basically involve components atomically setting up whatever parts of the store they need if it's not already there, so that everything can render whenever it feels like without worrying about what other code has already run. I'm not aware of a library that does this.

The other problem with Redux is that it puts developers in an "all you have is a hammer so everything looks like a nail" situation, vis-à-vis state management. Since it's so easy to put any moderately global state into Redux, you do, and you end up with things that should be local to a particular subtree or 'slice' of the app going through the global reducer chain and triggering every `useReducer()` in the whole app to re-run. Using `React.Context`, which will only update its explicitly subscribed children when it explicitly changes, will be much more efficient for anything that updates quickly or needs fast feedback.

(If you’re still using class components, keep in mind that `mapStateToProps` is run on every subscribed component on every store update. In large apps there can be easily hundreds of store updates on loading (which is a bad idea but what can you do), so if `mapStateToProps` does anything non-trivial you pay the cost hundreds of times. So ideally you might want this to just do something dumb (‘extract a few props’) rather than something complicated (‘massage every prop into the form you want it in’). Although, tbh, if you try to memoize class components with Redux involved you’re just going to have a bad time no matter what.)

Especially egregious is using Redux to orchestrate UI feedback that happens on the frame-level, such as animation or just having buttons be very responsive. If you want something to be snappy, don't call `dispatch()` and wait for it to finish. You'd be running potentially many thousands of lines of code to do something quickly! Why?! Stop it!

IMO a good rule of thumb is that Redux actions should be 1:1 with state changes that rebuild the UI in a non-trivial way, since those _necessarily_ involve many components being aware of the update and having the chance to respond to it. For everything else, you can use Contexts.

-------

## 9. Logging in Redux

While I'm on the subject: if you do use Redux, definitely _don't_ do your logging with it. It will never be the case that the list of Redux actions is the same, or even necessarily similar to, the list of events you want to log. Even if it was in the Redux sample app. Logging in Redux just pollutes everything -- the Redux action list, the reducer list, the number of Redux actions that you might have to step through in the debugger -- for no benefit, really. It takes something that's otherwise easy to read and splays it out into a mess of indirection (although arguably that's what Redux always does, lol).

Instead, either pass a `Logger` object around anywhere you need it, and maybe set up a global `React.Context` with your logger in it and let any component grab it from there. I generally think you shouldn’t use middleware at all, just a store + reducers, but some people are bound to disagree.

---------

Okay, that's my list.

After all that, I should probably mention that I do love React. React is great. It would be foolish to not use it or something like it for web development in 2023. I don't think it's the final library we'll be using to build interfaces on starships in 100 years, or whatever, but it's better than everything that came before it, and the future of application development will probably come in the form of looking *more* Reacty, not less. Or rather, it'll come in the form of better-delivering on React's promises than React already does, for instance by not having these landmines everywhere.