import Foundation

/// Read a number from the standard input.
///
/// Reads a line from the standard input and attempts to create an `Int` from it.
/// Performs no checking of the input and will crash if no input was read, or if the
/// value that was read cannot be converted to an `Int`. If you're not sure if the
/// user will enter a number, use `readText()` instead to perform additional
/// checks
///
/// - Returns: The user's input converted to an integer
public func readNumber() -> Int {
    return Int(readText())!
}

/// Read a line of text from the standard input.
///
/// Will crash if no input was read. This generally won't happen in situations where a
/// user is being prompted to enter text in a terminal, unless they enter a special End
/// Of File (EOF) sequence.
///
/// - Returns: The user's input
public func readText() -> String {
    return readLine()!
}

/// Clears the screen
///
/// Prints the ANSI sequences that clear the screen and moves the cursor to the
/// home position
public func clear() {
    print("\u{001B}[H \u{001B}2J")
}

/// Reads one character from the standard input
///
/// Returns as soon as a single key is pressed, there is no need for the user
/// to press return after typing their input
///
/// - Returns: The single character that the user entered, as a `String`
public func readOne() -> String {
    return "\(UnicodeScalar(getch()))"
}

/// Prints the path to the directory your program is currently running in
///
/// Similar to the `pwd` shell command. This may be useful if you're working in Xcode but want to
/// run the latest version of your program from your terminal application. Put `printDirectory()`
/// in your code to find the path to the executable that Xcode has built. Then you can `cd` to that directory
/// and run the program yourself.
@available(iOS 16.0, macOS 13.0, *)
public func printDirectory() {
    let dirURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
    print(dirURL.path())
}

extension FileHandle {
    func enableRawMode() -> termios {
        var raw = termios()
        tcgetattr(self.fileDescriptor, &raw)

        let original = raw
        raw.c_lflag &= ~UInt(ECHO | ICANON)
        tcsetattr(self.fileDescriptor, TCSADRAIN, &raw)
        return original
    }

    func restoreRawMode(originalTerm: termios) {
        var term = originalTerm
        tcsetattr(self.fileDescriptor, TCSADRAIN, &term)
    }
}

func getch() -> UInt8 {
    let handle = FileHandle.standardInput
    let term = handle.enableRawMode()
    defer { handle.restoreRawMode(originalTerm: term) }

    var byte: UInt8 = 0
    read(handle.fileDescriptor, &byte, 1)
    return byte
}
