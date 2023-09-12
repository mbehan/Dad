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
        case black, red, green, yellow, blue, magenta, cyan, white, original
        
        var code: String {
            switch self {
            case .black:
                return "30"
            case .red:
                return "31"
            case .green:
                return "32"
            case .yellow:
                return "33"
            case .blue:
                return "34"
            case .magenta:
                return "35"
            case .cyan:
                return "36"
            case .white:
                return "37"
            case .original:
                return "39"
            }
        }
    }

    enum BgColor: String {
        case black, red, green, yellow, blue, magenta, cyan, white, original
        
        var code: String {
            switch self {
            case .black:
                return "40"
            case .red:
                return "41"
            case .green:
                return "42"
            case .yellow:
                return "43"
            case .blue:
                return "44"
            case .magenta:
                return "45"
            case .cyan:
                return "46"
            case .white:
                return "47"
            case .original:
                return "49"
            }
        }
    }
}

func setColor(_ color: ANSI.BgColor) {
    print(ANSI.setColor(color.code), terminator: "")
}

func setColor(_ color: ANSI.TextColor) {
    print(ANSI.setColor(color.code), terminator: "")
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
