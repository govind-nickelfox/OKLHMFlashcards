//
//  Images.swift
//  AircraftRescue
//
//  Created by Navpreet Kailay Work on 05/07/22.
//  Copyright © 2022 Nickelfox. All rights reserved.
//

import Foundation
import UIKit

public struct Images {
    
    enum Splash: String {
        case launchImage = "LaunchImage"
        
        var image: UIImage? {
            return UIImage(named: self.rawValue)
        }
        
    }
    
    enum All: String {
        case appLogoIPhone = "app_logo_iPhone"
        case correctAnswer = "correct_answer"
        case incorrectAnswer = "incorrect_answer"
        case buyAll = "buy_All"
        
        var image: UIImage? {
            return UIImage(named: self.rawValue)
        }
    }
    
}
