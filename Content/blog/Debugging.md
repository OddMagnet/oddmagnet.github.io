---
date: 2020-07-31 13:52
description: Some notes on debugging techniques.
tags: Swift, Xcode, Debugging, Blog
---

# Debugging Techniques
A collection of some techniques that I learned over time, so far.

## Print Statements
I don't think there's much to write about these. Everybody has used them at some point and whoever says they never did is lying. It's not the worst possible way of debugging, certainly better than just staring at the code, but there are more efficient ways.

## Watching Variables
When a variable crashes the app and you don't know why, it's often a good idea to watch it while debugging. Luckily this doesn't need to be done manually, after setting a breakpoint and running the code Xcode will show an overview of variables in the debug area, simply right-clicking a variable and selecting `Watch VariableName` is enough.

In the _Breakpoint Navigator_ (`⌘8`) you'll then not only see the breakpoints you set, but also the _Watchpoints_, the variables Xcode is watching.
When continuing with the apps execution Xcode will not only stop at breakpoints, but every time the watched variable changes and show exactly what changed.

Once Xcode stop at a point where the variable changed to an unexpected value - and likely shows the rather unhelpful assembly code -, the _Debug Navigator_ (`⌘7`) can be used to navigate through the function calls and find the bug.

Compared to print statements it's much easier to watch a variable once and just check the function where it's value got changed unexpectedly instead of placing prints everywhere.

## Exception Breakpoints
Sometimes code crashes and we're left nowhere close to the code we actually wrote and we need scroll up in the debug output, past all the stuff that doesn't tell us anything, to get to the point where the error actually happened.

In the _Breakpoint Navigator_, using the '+' symbol in the bottom left, an _Exception Breakpoint_ can be created, this sort of breakpoint will stop the execution of the code as soon as an exception is thrown, which means the execution doesn't go through to the crash.

The debug area might still now show helpful output, going back into the _Debug Navigator_ and selecting the last function call, then entering `po $arg1` in the console window will print the objective-c description of an object, in this case the error message that was previously shown at the top of a very, very long output in the console.

Since this is such a common scenario, it's possible to edit the breakpoint and add an action, that does exactly that, execute the command from above in the console when the breakpoint is hit. Even more, it's possible to right-click it and choose _Move to_ followed by selecting _User_, which will make the breakpoint available in all projects, not just the current one.