//
//  Storyboards.swift
//  AircraftRescue
//
//  Created by Ravindra Soni on 11/12/18.
//  Copyright © 2018 Nickelfox. All rights reserved.
//


import Foundation
import FLUtilities
import UIKit

public enum Storyboard: String {
    case root = "Root"
    case home = "Home"
    case flashcard = "FlashCard"
    case examPrep = "ExamPrep"
    case inAppPurchase = "InAppPurchase"
    case menuSheet = "MenuSheet"
    case main = "Main"
    
    var name: String {
        return self.rawValue
    }
}

public extension UIViewController {
    static var storyboardId: String {
        return self.className()
    }
}
