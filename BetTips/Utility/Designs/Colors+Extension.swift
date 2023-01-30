import SwiftUI

// MARK: Color
extension Color {
    /**
    Color with android style #hexColorCode
    */
    init?(hexString: String) {
        let rgbaData = getrgbaData(hexString: hexString)
        if rgbaData != nil {
            self.init(
                .sRGB,
                red: Double(rgbaData!.red),
                green: Double(rgbaData!.green),
                blue: Double(rgbaData!.blue),
                opacity: Double(rgbaData!.alpha)
            )
            return
        }
        return nil
    }
}

private func getrgbaData(hexString: String) -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)? {
    var rgbaData : (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)?
    if hexString.hasPrefix("#") {
        let start = hexString.index(hexString.startIndex, offsetBy: 1)
        let hexColor = String(hexString[start...]) // Swift 4
        let scanner = Scanner(string: hexColor)
        var hexNumber: UInt64 = 0
        if scanner.scanHexInt64(&hexNumber) {
            rgbaData = { // start of a closure expression that returns a Vehicle
                switch hexColor.count {
                case 8: return ( red: CGFloat((hexNumber & 0xff000000) >> 24) / 255,
                                 green: CGFloat((hexNumber & 0x00ff0000) >> 16) / 255,
                                 blue: CGFloat((hexNumber & 0x0000ff00) >> 8)  / 255,
                                 alpha: CGFloat( hexNumber & 0x000000ff)        / 255
                    )
                case 6: return ( red: CGFloat((hexNumber & 0xff0000) >> 16) / 255,
                                 green: CGFloat((hexNumber & 0x00ff00) >> 8)  / 255,
                                 blue: CGFloat((hexNumber & 0x0000ff))       / 255,
                                 alpha: 1.0
                    )
                default:
                    return nil
                }
            }()
        }
    }
    return rgbaData
}
