//
//  Colors.swift
//  FireInspection
//
//  Created by Ravindra Soni on 11/12/18.
//  Copyright © 2018 Nickelfox. All rights reserved.
//

import Foundation
import FLUtilities
import UIKit

public struct Colors {
    static var primaryColor: UIColor {
        return UIColor(hexString: "F7C004")
    }
    
    static var disabledGrey: UIColor {
        return UIColor(hexString: "7B7979")
    }
    
    static var grey636466: UIColor {
        return UIColor(hexString: "636466")
    }
    
    static var grey434342: UIColor {
        return UIColor(hexString: "434342")
    }
    
    static var black231F20: UIColor {
        return UIColor(hexString: "231F20")
    }
    
    static var redColor: UIColor {
        return UIColor(hexString: "DD6551")
    }

    static var greenColor: UIColor {
        return UIColor(hexString: "60D07D")
    }
    
    static var secondaryDark: UIColor {
        return UIColor(hex: 0x636466)
    }
    
    static var primaryYellow: UIColor {
        return UIColor(hex: 0xF7C004)
    }
    static var primaryDark: UIColor {
        return UIColor.black
    }
  
    static var incorrectOptionColor: UIColor {
        return UIColor.init(hexString: "DD6551")
    }
    
    static var correctOptionColor: UIColor {
        return UIColor.init(hexString: "60D07D")
    }
    
    static var skippedOptionColor: UIColor {
        return UIColor.init(hexString: "F7C004")
    }
    
    static var offWhiteColor: UIColor {
        return UIColor.init(hexString: "FFFFFF").withAlphaComponent(0.9)
    }
    
    static var secondaryDarkColor: UIColor {
        return UIColor(hexString: "231F20")
    }

    static var secondryGrey: UIColor {
        return UIColor(hexString: "A3A3A3")
    }
    
}
