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

