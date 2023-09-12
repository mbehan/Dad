import Foundation

struct ANSI {
    static let escape = "\u{001B}"
    static let csi = "[" // control sequence introducer
    static let delim = ";" // argument delimeter
    static let defaultTextStyle = "0"
    static let endOfStyle = "m"
    
    static func setColor(_ colorCode: String) -> String {
        return "\(ANSI.escape)\(ANSI.csi)\(ANSI.defaultTextStyle)\(ANSI.delim)\(colorCode)\(ANSI.endOfStyle)"
    }
    
    enum TextColor: String {
        case black = "30"
        case red = "31"
        case green = "32"
        case yellow = "33"
        case blue = "34"
        case magenta = "35"
        case cyan = "36"
        case white = "37"
        case original = "39"
    }

    enum BgColor: String {
        case black = "40"
        case red = "41"
        case green = "42"
        case yellow = "43"
        case blue = "44"
        case magenta = "45"
        case cyan = "46"
        case white = "47"
        case original = "49"
    }
}

func setColor(_ color: ANSI.BgColor) {
    print(ANSI.setColor(color.rawValue), terminator: "")
}

func setColor(_ color: ANSI.TextColor) {
    print(ANSI.setColor(color.rawValue), terminator: "")
}

/// Set the colour of text that will be output using `print()`
///
/// You must specify one of the supported colours as a `String`. If you provide anything
/// else an error will be printed and there will be no change made to your output. Colour
/// names are *not* case sensitvie.
///
/// The supported colours are:
///
/// * Black
/// * Red
/// * Green
/// * Yellow
/// * Blue
/// * Magenta
/// * Cyan
/// * White
/// * Original
///
///  To revert to your terminal's default text colour you can specify `"original"`
///
/// - Note: Most terminals support colour output but Xcode's debug console does not
/// - Parameter colorName: a `String` containing the name of your desired colour
public func setTextColor(_ colorName: String) {
    if let color = ANSI.TextColor(rawValue: colorName.lowercased()) {
        setColor(color)
    } else {
        print("Error: Unknown colour \(colorName)")
    }
}

/// Set the colour of the background that will be output using `print()`
///
/// You must specify one of the supported colours as a `String`. If you provide anything
/// else an error will be printed and there will be no change made to your output. Colour
/// names are *not* case sensitvie.
///
/// The supported colours are:
///
/// * Black
/// * Red
/// * Green
/// * Yellow
/// * Blue
/// * Magenta
/// * Cyan
/// * White
/// * Original
///
///  To revert to your terminal's default background colour you can specify `"original"`
///
/// - Note: Most terminals support colour output but Xcode's debug console does not
/// - Parameter colorName: a `String` containing the name of your desired colour
public func setBackgroundColor(_ colorName: String) {
    if let color = ANSI.BgColor(rawValue: colorName.lowercased()) {
        setColor(color)
    } else {
        print("Error: Unknown colour \(colorName)")
    }
}
