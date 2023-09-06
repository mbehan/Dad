# Dad

A Swift package containing functions for novice programmers making their first command line apps. Avoid getting bogged down in more advanced concepts until you're ready for them.

## Motivation

I'm making this package for my 11 year old son who is just starting to learn some programming. There are certain aspects of the Swift language that are distracting for the programming novice but are hard to avoid. I'm creating some functions to delay their appearance until we're ready.

We're beginning with creating command line applications so expect helper methods to make that a bit easier and more interesting too.

Originally I wrote functions like this directly in his programs, but now we've moved on from manually compiling single-file programs ourselves with `swiftc` to the world of IDEs and Xcode so we're learning about importing packages. Now when he needs me he can `import Dad` and so can anyone else that's interested. 

## Usage

Add this Swift package to your project and `import Dad` wherever you want to use any of its functions. Functions are all defined globally, you don't need to set anything up, just call them.

## Command Line Interaction

| Function | Description |
| --- | --- |
| `readText()` | Read a line of text from the standard input, returns a `String` |
| `readNumber()` | Read a number from the standard input, returns an `Int` |
| `readOne()` |   Read a single character from the standard input as soon as it is typed, returns a `String`     |
| `clear()` | Clears the the screen, similar to the `clear` shell command |

With just these functions, `print`, conditionals and the basic `while` loop you can build a huge variety of programs and games. Enjoy!
