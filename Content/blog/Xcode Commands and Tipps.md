---
date: 2020-08-08 19:15
description: Some notes on commands in Xcode and some tipps.
tags: Xcode, Blog
---

# Xcode Commands and Tipps

After the last post - Debugging - I think having a post about lesser known commands and some tipps is a good fit, so here are some of the things that I consider useful to know.

## Searching and opening files
Projects get big over time, especially if code is well encapsulated and views are kept small, for those who don't memorise the content and location of every single file, this command will be useful.  
`⌘⇧O` will open a search box that uses the same fuzzy matching that is also used for code completion.  
This means that typing something like `somevc` will match `someUsefulViewController`. Additionally this can be used to quickly take a look into Apple's own classes.  

Sadly the above command does not reveal the file in the project navigator, for this `⌘⇧J` can be used.

Now that the file is located, maybe you want to open it in a new windows? Or maybe a tab? Or the Assistant Editor? By holding `⌥⇧` while clicking the file a popup will appear which offers the options mentioned above for opening the file.

## Editing Files
This is probably the section that most people already know, so it's more for new Xcode users. 

`⌘/` comments/uncomments the current line (or selection if applicable).  
`⌘[` and `⌘]` indent and outdent the selected code respectively.  
`⌃I` automatically correctly indents the selected code.

The least known thing in this section is likely the `⌥⌘/` command, which adds a template for documentation before the current function.  
__Note:__ this command is problematic for the german keyboard layout since `/` and `\ ` both use the `7` key, one just adds the `⌥` modifier in addition to the `⇧` modifier.

## Finding information
Above I wrote above quickly opening Apple's own files to take a look at classes and function, but there are a few more ways to get that information.

Selecting something while the **Quick Help Inspector** is visible (`⌥⌘3`) will show useful information in it.

The same information can be viewed by clicking something while holding `⌥`.

Finally, there are 4 ways to jump to the definition of something:
1. Right clicking and choosing _Jump to definition_
2. Clicking while holding `⌘`, then choosing _Jump to definition_
3. Clicking while holding `⌃⌘` will directly jump to the definition
4. Pressing `⌃⌘J` with something selected will also jump to the definition

## Jump Bar and Markers
Right above the code is the jump bar, which usually shows the path to the current file as well as the current method you're in. When clicked it opens up to show all folders at the clicked level, or when the last level is clicked all the functions inside the current file.  
Sometimes however this can be quite a long list, luckily it's easily searchable by just typing after opening it.  
Alternatively `⌃6` will open the jump bar at the final level.

One thing I really like about the jump bar is that it shows markers placed in the file. Markers are comments that follow a special syntax.  
`// MARK: yourTextHere` will place a marker in the jump bar that is name _yourTextHere_ 

It's possible to add separators to the jump bar by adding a `-` before or after the marker name, or just use it as a standalone separator.  
`// MARK: - separatorBefore`  
`// MARK: separatorAfter -`  
`// MARK: -`  
This is most useful for visually grouping functionality in the jump bar, or when use the separator before and after to mark a long section in the jump bar.

Aside from just the `MARK` keyword there's also  
`// TODO: some todo reminder`  
and  
`// FIXME: some bug reminder`

## Cleaning and Breakpoints
When a Xcode suddenly can't build the project anymore, especially when there are no errors/warning, it's worth a try using `⇧⌥⌘K`. This command cleans the build folder so that Xcode really builds the project from scratch again.

The project compiling sadly doesn't mean that there are no bugs, to help find them here are some useful commands.  
`⌥⌘/` places a breakpoint on the current line.  
`⌘Y` toggles all breakpoints globally.  
Additionally, right clicking a breakpoint allows for adding information, e.g. a condition for the breakpoints or some sort of action, like executing a LLDB command in the console.