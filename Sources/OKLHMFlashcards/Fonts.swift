//
//  Fonts.swift
//  FireInspection
//
//  Created by Ravindra Soni on 11/12/18.
//  Copyright © 2018 Nickelfox. All rights reserved.
//


import UIKit

extension UIFont {
  
    class func poppinsRegular(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Poppins-Regular", size: size)!
    }
    
    class func poppinsMedium(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Poppins-Medium", size: size)!
    }
    
    class func poppinsBlack(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Poppins-Black", size: size)!
    }
    
    class func poppinsBold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Poppins-Bold", size: size)!
    }
    
    class func poppinsThin(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Poppins-Thin", size: size)!
    }
}


public struct AppFont {
    static func getFont(fontType: FontType) -> UIFont {
        let defaultFont = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            return UIFont(name: fontType.name, size: fontType.fontSizeIPad) ?? defaultFont
        default:
            return UIFont(name: fontType.name, size: fontType.fontSizeIPhone) ?? defaultFont
        }
    }
}

public enum FontType {
    
    case h1, h2, p1, p2, p3, p4, p5, p6, h3, h16, p7, p8, m1, m2, m3, m4, m6, m7, m8, m9, m10, m14, h14, p12, p24, h24, p14, p13
    var name: String {
        switch self {
        case .h1, .h2, .h3, .p7, .p8, .h14, .h24:
            return "Poppins-SemiBold"
        case .p1, .p2, .p3, .p4, .p5, .p6, .p12, .p24, .p14, .p13, .h16:
            return "Poppins-Regular"
        case .m1, .m4, .m6, .m8, .m9, .m10:
            return "Lato-Bold"
        case .m2:
            return "Helvetica Neue Bold"
        case .m3, .m7, .m14:
            return "Lato-Regular"
        }
    }
    
    var fontSizeIPhone: CGFloat {
        switch self {
        case .h1:
            return 16
        case .h2, .p3:
            return 12
        case .p2, .h3:
            return 14
        case .p1:
            return 16
        case .p4:
            return 18
        case .p5:
            return 16
        case .p6:
            return 14
        case .p7:
            return 12
        case .p8:
            return 14
        case .m1:
            return 24
        case  .m2:
            return 18
        case .m3, .m10:
            return 14
        case .m4, .h16:
            return 16
        case .m6:
            return 18
        case .m7:
            return 6
        case .m8:
            return 14
        case .m9:
            return 26
        case .h14, .m14:
            return 14
        case .p12:
            return 12
        case .p24:
            return 24
        case .h24:
            return 24
        case .p14:
            return 14
        case .p13:
            return 13
        }
    }
    
    var fontSizeIPad: CGFloat {
        switch self {
        case .h1:
            return 20
        case .h2, .p3:
            return 18
        case .p2, .h3:
            return 18
        case .p1:
            return 16
        case .p4:
            return 18
        case .p5:
            return 20
        case .p6:
            return 18
        case .p7:
            return 14
        case .p8:
            return 16
        case .m1:
            return 26
        case .m2:
            return 20
        case .m3, .m10, .h16:
            return 16
        case .m4:
            return 18
        case .m6:
            return 20
        case .m7:
            return 8
        case .m8:
            return 16
        case .m9:
            return 26
        case .h14, .m14:
            return 14
        case .p12:
            return 12
        case .p24:
            return 24
        case .h24:
            return 24
        case .p14:
            return 14
        case .p13:
            return 13
        }
    }
}
