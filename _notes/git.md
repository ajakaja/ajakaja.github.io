---
layout: article
title: "A Very Brief Shell and Git Reference"
math: true
footnotes: true
tag: tech
---

For non-technical Mac users who want to dip their toes in being technical.

## 1. Basic shell usage

Step 1: open a terminal

`⌘+<space>` -> `terminal` -> `Enter`

A window should pop up. You can type things in it. It is your computer, but presented in a text interface. This is where you will use git. Actually, you can use git from a UI, but I really really think you will be happier if you do it this way. It is not that hard.

If you think it is ugly or annoying, there are a million ways to fix that -- but, later.

A few commands:

`pwd` : "**p**rint **w**orking **d**irectory" -- tells you what folder you're in. It will probably say something like `/Users/ajk`. `/Users/<your login id>` is called your 'home directory', and you can refer to it with `~`. All folder locations start with `/` which is the 'bottom' of your computer.

`echo <something>`: echoes `<something>` back to you. 

* `echo ~` : prints `/Users/<your name`
* `echo $PWD` : prints the value of the variable `$PWD`, which is the exact same thing that `pwd` does.

`ls` : **l**i**s**ts the current directory's contents. Or `ls <somewhere>` to list the contents of something else. Maybe try:

* `ls`
* `ls ~`
* `ls /`
* `ls ~/Desktop`

In general, commands can have _flags_, which are parameters added with hyphens `-` afterwards, and _arguments_, which are free-standing things (without hyphens). For example, `ls -alh ~` says "list the contents of `~`, with the modifications `-alh`". I could also write that as `ls -a -l -h ~` ; you're (usually) allowed to combine flags into one. `-a` means "include hidden files", which are files whose names start with `.`. (Try `ls -a ~` to see how many hidden files there are! The Mac UI hides them also.). `-l` means "list in 'long' format", which has more information -- specifically, filesizes. `-h` says "make the file sizes human-readable, using prefixes like `G` for gigabyte instead of just a huge number. 

(note: every command has different flags. Most (though not `ls`) have `-h` for 'help' and `-v` for 'verbose', though.) 

`cd <directory>` : **c**hange **d**irectory: moves directories. Your options are:
* _relative_ folders, like `cd Desktop`.
* _absolute_ folders, like `cd /Users/<your id>/Desktop`
* `.` : the current folder, always. (`cd .` does nothing).
* `..`: the parent folder, always. So `cd ..` when you're in `/Users/<your id>` takes you to `/Users`.

A couple other useful things:

`which <command>` : tells you where a command is located. For instance, when I type `which git` I get `/usr/bin/git`. If I type `ls /usr/bin` I will see a list that includes `git`.

`less <file>` : opens a file to read as text. The UI is very unintuitive. `b` goes down and `d` goes up and `q` quits. Actually, `less` is fantastic, but it'll be a while before you're used to it. There are tons more features. Just don't ask about the name (okay -- it's a pun on its predecessor `more` which showed you 'more' of a file).

`man <command>` : opens the 'manual' for the command. It's usually a huge pain to read cause it's wordy, but it does usually have what you want. It's normal to not tell you, really, how to use a tool -- once you know it exists you can look it up in `man`. It opens the manual in `less` so don't forget about `b`, `d`, and `q`.

`cat <file>` : **cat**enates the contents of the file to the terminal. Good for quickly reading short things.

`rm <file>` : **r**e**m**oves a file. `rm -r` to remove directories and all their contents. Be very careful...

`open <something>` : opens the target in the explorer, if you're tired of typing and would rather start clicking.

`mv <file> <destination>` : moves something to a new location. Also used to rename things.

`cp <file> <destination>`: copies a file.

`mkdir <name>` : makes a directory.

If a command ever does things and won't stop, type `ctrl+C` or `ctrl+D`. They work slightly differently, but usually one will stop whatever's going on. In shell-lingo `ctrl` is written as `^C`, so these are `^C` and `^D`. 

Now try:

`yes` : just says 'y' repeatedly. Weird, right? You'll need `^C` to get it to stop.

## 2. Getting Git

I am not sure if you will already have Git set up on your computer. If not, the _best_, though not easiest, way to do it is going to be:

1. Install HomeBrew, which is a 'package manager' for Macs, and will let you install tons of stuff with a single line in the terminal. See [here](https://brew.sh/) for instructions.

2. Install Git with Homebrew, by typing `brew install git`. Thereafter `git` should exist in your terminal.

Why use Homebrew? Because you can also type `brew install r` or `brew install python` (though you might have that already) or a million other things.

There is some setup that will be necessary later also:

1. Set up your user name, via `git config --global user.name "<your name>"`.
2. Set your email, via `git config --global user.email "<email@example.com>"`. Your commits will be tagged with these two.
3. Make a Github account [here](https://github.com/).

Now, I'm not sure what you want to do with Git or what repositories you're interested in touching, so I'll leave the rest of Github discussion for you to figure out. But first, a primer on Git.

## 3. Git Basics

Git is a way of saving and sharing your work. You could just ... save it and email it, I guess. But Git is more _robust_. It lets you do things like:

* look at how a file changed over time
* merge two changed versions of a file into one new version
* revert a change to a file to an old version because it broke something 
* take someone else's work and _fork_ it into a new version that you modify.
* switch between multiple versions of your work that coexist on your computer in the same place, called _branches_.

Git creates things called _repositories_ (colloquially 'repos') and links them together. A repository is a folder on a computer that has a `.git` hidden directory, which is filled with secret git-related information.
