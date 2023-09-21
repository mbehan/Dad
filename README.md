# Dad

A Swift package containing functions for novice programmers making their first command line apps. Avoid getting bogged down in more advanced concepts until you're ready for them.

## Motivation

I'm making this package for my 11 year old son who is just starting to learn some programming. There are certain aspects of the Swift language that are distracting for the programming novice but are hard to avoid. I'm creating some functions to delay their appearance until we're ready.

We're beginning with creating command line applications so this package includes helpers to make that a bit easier and more interesting too.

Originally I wrote functions like these directly in his programs, but now we've moved on from manually compiling single-file programs ourselves with `swiftc` to the world of IDEs and Xcode so we're learning about importing packages. Now when he needs me he can `import Dad`, and so can anyone else that finds it useful. 

## OS Support

This package is intended to be used on both macOS and Windows but certain functions are not available on Windows.

## Usage

Add this Swift package to your project and `import Dad` wherever you want to use any of its functions. The functions are all defined globally so you don't need to set anything up, just call them.

All of the functions are documented, try the "Quick Help inspector" or option-click a function name in Xcode to read the documentation.

With just these few functions, `if`, `var` and `print()` you can build a huge variety of command line programs and games. Enjoy!

## Command Line Interaction

| Function | Description |
| --- | --- |
| `readText()` | Read a line of text from the standard input, returns a `String` |
| `readNumber()` | Read a number from the standard input, returns an `Int` |
| `readOne()` |   Read a single character from the standard input as soon as it is typed, returns a `String`     |
| `clear()` | Clears the the screen, similar to the `clear` shell command |
| `printDirectory()` | Prints the directory the program is running from, convenient if you want to see where Xcode is putting things |

## Colours

Make your command line apps more itneresting by adding colour to your output. Use `setTextColor` and `setBackgroundColor` to change the colour used by subsequent print statements. These functions take colour names as a `String` for their input like so:

```swift
setTextColor("red")
print("This will be red")

setBackgroundColor("yellow")
print("     This will be in a yellow stripe!     ")
```

The following colours are supported:

* black
* red
* green
* yellow
* blue
* magenta
* cyan
* white
* original (your terminal's default setting)

## Other Features

### Loops

If you're struggling with looping, this package provides an alternative with `loop`. Here's an example usage

```swift
loop(times: 5) {
    print("Hello world!")
}
```

Any code between the braces `{ }` will be repeated the number of times specified by the `times` parameter. You can put as many lines of code inside the braces as you wish, and the times paramater can be a number that you "hard code", like 5 in the example or a variable.
