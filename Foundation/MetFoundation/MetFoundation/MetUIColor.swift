//
//  MetUIColor.swift
//  MetFoundation
//
//  Created by Do Kiyong on 11/8/23.
//

import Foundation
import UIKit

extension UIColor {
    
    var alphaValue: CGFloat { return CIColor(color: self).alpha }

    /// RGB가 각각 `red`, `green`, `blue`이고 opacity는 `a`인 Color object 반환
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(red: CGFloat(red) / 255.0,
                  green: CGFloat(green) / 255.0,
                  blue: CGFloat(blue) / 255.0,
                  alpha: a
        )
    }

    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        
        Scanner(string: hex).scanHexInt64(&int)
        
        let a, r, g, b: UInt64
        
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

extension UIColor {
    /// RGB가 `hex`, opacity는 1에 해당하는 Color object 반환
    convenience init(hex: Int) {
        self.init(
            red: (hex >> 16) & 0xff,
            green: (hex >> 8) & 0xff,
            blue: hex & 0xff
        )
    }
}

extension UIColor {

    public static var gray025: UIColor { return UIColor(named: "gray025") ?? UIColor(hex: 0xFAFAFA) }
    public static var gray050: UIColor { return UIColor(named: "gray050") ?? UIColor(hex: 0xF5F5F5) }
    public static var gray100: UIColor { return UIColor(named: "gray100") ?? UIColor(hex: 0xEBEBEB) }
    public static var gray150: UIColor { return UIColor(named: "gray150") ?? UIColor(hex: 0xE6E6E6) }
    public static var gray200: UIColor { return UIColor(named: "gray200") ?? UIColor(hex: 0xD9D9D9) }
    public static var gray250: UIColor { return UIColor(named: "gray250") ?? UIColor(hex: 0xCDCDCD) }
    public static var gray300: UIColor { return UIColor(named: "gray300") ?? UIColor(hex: 0xB4B4B4) }
    public static var gray400: UIColor { return UIColor(named: "gray400") ?? UIColor(hex: 0x999999) }
    public static var gray500: UIColor { return UIColor(named: "gray500") ?? UIColor(hex: 0x808080) }
    public static var gray600: UIColor { return UIColor(named: "gray600") ?? UIColor(hex: 0x666666) }
    public static var gray700: UIColor { return UIColor(named: "gray700") ?? UIColor(hex: 0x4D4D4D) }
    public static var gray800: UIColor { return UIColor(named: "gray800") ?? UIColor(hex: 0x333333) }
    public static var gray900: UIColor { return UIColor(named: "gray900") ?? UIColor(hex: 0x222222) }
    public static var gray950: UIColor { return UIColor(named: "gray950") ?? UIColor(hex: 0x161616) }
    public static var gray238: UIColor { return UIColor(named: "gray238") ?? UIColor(hex: 0xEEEEEE) }

    public static var black: UIColor { return UIColor(named: "black") ?? UIColor(hex: 0x000000) }
    public static var metWhite: UIColor { return UIColor(named: "white") ?? UIColor(hex: 0xFFFFFF) }

    public static var blue050: UIColor { return UIColor(named: "blue050") ?? UIColor(hex: 0xEAEAFF) }
    public static var blue100: UIColor { return UIColor(named: "blue100") ?? UIColor(hex: 0xCACAFF) }
    public static var blue200: UIColor { return UIColor(named: "blue200") ?? UIColor(hex: 0xA4A7FF) }
    public static var blue300: UIColor { return UIColor(named: "blue300") ?? UIColor(hex: 0x7B83FF) }
    public static var blue400: UIColor { return UIColor(named: "blue400") ?? UIColor(hex: 0x5A65FF) }
    public static var blue500: UIColor { return UIColor(named: "blue500") ?? UIColor(hex: 0x3746FF) }
    public static var blue600: UIColor { return UIColor(named: "blue600") ?? UIColor(hex: 0x2C34EC) }
    public static var blue700: UIColor { return UIColor(named: "blue700") ?? UIColor(hex: 0x2026E0) }
    public static var blue800: UIColor { return UIColor(named: "blue800") ?? UIColor(hex: 0x1314D4) }
    public static var blue900: UIColor { return UIColor(named: "blue900") ?? UIColor(hex: 0x0000C0) }

    public static var red050: UIColor { return UIColor(named: "red050") ?? UIColor(hex: 0xFFEBEF) }
    public static var red100: UIColor { return UIColor(named: "red100") ?? UIColor(hex: 0xFFCDD5) }
    public static var red200: UIColor { return UIColor(named: "red200") ?? UIColor(hex: 0xFC999D) }
    public static var red300: UIColor { return UIColor(named: "red300") ?? UIColor(hex: 0xF76F77) }
    public static var red400: UIColor { return UIColor(named: "red400") ?? UIColor(hex: 0xFF4853) }
    public static var red500: UIColor { return UIColor(named: "red500") ?? UIColor(hex: 0xFF2D36) }
    public static var red600: UIColor { return UIColor(named: "red600") ?? UIColor(hex: 0xFC2137) }
    public static var red700: UIColor { return UIColor(named: "red700") ?? UIColor(hex: 0xEA0F31) }
    public static var red800: UIColor { return UIColor(named: "red800") ?? UIColor(hex: 0xDD0029) }
    public static var red900: UIColor { return UIColor(named: "red900") ?? UIColor(hex: 0xCF001A) }

    public static var yellow050: UIColor { return UIColor(named: "yellow050") ?? UIColor(hex: 0xFFF3E0) }
    public static var yellow100: UIColor { return UIColor(named: "yellow100") ?? UIColor(hex: 0xFFDFB1) }
    public static var yellow200: UIColor { return UIColor(named: "yellow200") ?? UIColor(hex: 0xFFCA7F) }
    public static var yellow300: UIColor { return UIColor(named: "yellow300") ?? UIColor(hex: 0xFFB44C) }
    public static var yellow400: UIColor { return UIColor(named: "yellow400") ?? UIColor(hex: 0xFFA424) }
    public static var yellow500: UIColor { return UIColor(named: "yellow500") ?? UIColor(hex: 0xFF9400) }
    public static var yellow600: UIColor { return UIColor(named: "yellow600") ?? UIColor(hex: 0xFF8800) }
    public static var yellow700: UIColor { return UIColor(named: "yellow700") ?? UIColor(hex: 0xF97802) }
    public static var yellow800: UIColor { return UIColor(named: "yellow800") ?? UIColor(hex: 0xF36703) }
    public static var yellow900: UIColor { return UIColor(named: "yellow900") ?? UIColor(hex: 0xEA4B04) }

    public static var green300: UIColor { return UIColor(named: "green300") ?? UIColor(hex: 0x4EFEA2) }
    public static var green400: UIColor { return UIColor(named: "green400") ?? UIColor(hex: 0x00FA8A) }
    public static var green500: UIColor { return UIColor(named: "green500") ?? UIColor(hex: 0x00F477) }
    public static var green600: UIColor { return UIColor(named: "green600") ?? UIColor(hex: 0x00E26A) }
    public static var green700: UIColor { return UIColor(named: "green700") ?? UIColor(hex: 0x00CE5C) }
    public static var green800: UIColor { return UIColor(named: "green800") ?? UIColor(hex: 0x00BB50) }
    public static var green900: UIColor { return UIColor(named: "green900") ?? UIColor(hex: 0x00993A) }

    public static var purple300: UIColor { return UIColor(named: "purple300") ?? UIColor(hex: 0x9E6CFF) }
    public static var purple400: UIColor { return UIColor(named: "purple400") ?? UIColor(hex: 0x8347FE) }
    public static var purple500: UIColor { return UIColor(named: "purple500") ?? UIColor(hex: 0x6618FF) }
    public static var purple600: UIColor { return UIColor(named: "purple600") ?? UIColor(hex: 0x5614D9) }
    public static var purple700: UIColor { return UIColor(named: "purple700") ?? UIColor(hex: 0x4710B2) }

    public static var graph_bar050: UIColor { return UIColor(named: "graph_bar050") ?? UIColor(hex: 0xE0E4E9) }
    public static var graph_bar100: UIColor { return UIColor(named: "graph_bar100") ?? UIColor(hex: 0xB3BBD2) }
    public static var graph_bar700: UIColor { return UIColor(named: "graph_bar700") ?? UIColor(hex: 0x5B636C) }
    public static var graph_line: UIColor { return UIColor(named: "graph_line") ?? UIColor(hex: 0xCFD6DF) }
    public static var graph_blue: UIColor { return UIColor(named: "graph_blue") ?? UIColor(hex: 0xAABCFF) }
    public static var graph_teal: UIColor { return UIColor(named: "graph_teal") ?? UIColor(hex: 0x31D6C6) }
    public static var graph_cyan: UIColor { return UIColor(named: "graph_cyan") ?? UIColor(hex: 0x16B9FF) }
    public static var graph_lemon: UIColor { return UIColor(named: "graph_lemon") ?? UIColor(hex: 0xFCF21F) }
    public static var graph_olive: UIColor { return UIColor(named: "graph_olive") ?? UIColor(hex: 0xDAEF0F) }
    public static var graph_pink: UIColor { return UIColor(named: "graph_pink") ?? UIColor(hex: 0xCA1CF1) }
    public static var graph_brown: UIColor { return UIColor(named: "graph_brown") ?? UIColor(hex: 0x6B453A) }

    /// RGB(248,248,248)
    public static var gray_F8F8F8: UIColor { return UIColor(hex: 0xF8F8F8)}
    /// REB(225,225,228)
    /// RGB(232, 236, 241)
    public static var gray_E8ECF1: UIColor { return UIColor(hex: 0xE8ECF1)}
    /// RGB(241, 242, 255)
    public static var gray_F1F2FF: UIColor { return UIColor(hex: 0xF1F2FF)}
    public static var red_FC5C6C: UIColor { return UIColor(hex: 0xFC5C6C)}
    public static var gray_C0C0C0: UIColor { return UIColor(hex: 0xC0C0C0)}
    
}

extension UIColor {
    /// Opacity값이 `opacity`인 Color object 반환
    func alpha(_ opacity: CGFloat) -> UIColor {
        return self.withAlphaComponent(opacity)
    }
    
}

extension UIImage {
    
    public static func from(color: UIColor) -> UIImage {
       let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
       UIGraphicsBeginImageContext(rect.size)
       
       let context = UIGraphicsGetCurrentContext()
       context!.setFillColor(color.cgColor)
       context!.fill(rect)
       
       let img = UIGraphicsGetImageFromCurrentImageContext()
       UIGraphicsEndImageContext()
       
       return img!
   }
   
    public static func UIColorFromRGB(rgbValue: UInt) -> UIColor {
         return UIColor(
             red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
             green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
             blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
             alpha: CGFloat(1.0)
         )
     }
    
}

