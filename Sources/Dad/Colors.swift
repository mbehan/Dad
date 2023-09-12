import Foundation

struct ANSI {
    static let escape = "\u{001B}"
    static let csi = "[" // control sequence introducer
    static let delim = ";" // argument delimeter
    static let defaultTextStyle = "0"
    static let endOfStyle = "m"
    
    static func setColor(_ color: Color) -> String {
        return "\(ANSI.escape)\(ANSI.csi)\(ANSI.defaultTextStyle)\(ANSI.delim)\(color.rawValue)\(ANSI.endOfStyle)"
    }
}

enum Color: String {
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

func setColor(_ color: Color) {
    print(ANSI.setColor(color), terminator: "")
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
public func setColor(_ colorName: String) {
    if let color = Color(rawValue: colorName.lowercased()) {
        setColor(color)
    } else {
        print("Error: Unknown colour \(colorName)")
    }
}
