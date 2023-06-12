//
//  Fonts + Helper.swift
//  AircraftRescue
//
//  Created by Navpreet Kailay Work on 06/07/22.
//  Copyright © 2022 Nickelfox. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func setFont(_ fontType: FontType) {
        self.font = AppFont.getFont(fontType: fontType)
    }
    
    func setLabelBorder() {
        self.layer.cornerRadius = 10
       // self.layer.borderColor = #colorLiteral(red: 0.6901960784, green: 0.7882352941, blue: 0.9019607843, alpha: 0.8470588235)
    }
    
}

extension UIButton {
    func setFont(_ fontType: FontType) {
        self.titleLabel?.font = AppFont.getFont(fontType: fontType)
    }
    func setButtonBorder() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 0.5
        self.layer.borderColor = #colorLiteral(red: 0.6901960784, green: 0.7882352941, blue: 0.9019607843, alpha: 0.8470588235)
    }
    
    
    func setButtonBorderMap() {
        self.layer.cornerRadius = 20
    }
    func setButtonCornerRounded() {
        self.layer.cornerRadius = 5

    }
    
    
    func setButtonColor() {
        self.backgroundColor = Colors.primaryDark
        self.layer.cornerRadius = 20
    }
}


extension UITextField {
    func setFont(_ fontType: FontType) {
        self.font = AppFont.getFont(fontType: fontType)
    }
}

extension UITextView {
    func setFont(_ fontType: FontType) {
        self.font = AppFont.getFont(fontType: fontType)
    }
}


extension UIView {
        func setViewBorder() {
        self.backgroundColor = .clear
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 0.5
        self.layer.borderColor = #colorLiteral(red: 0.6901960784, green: 0.7882352941, blue: 0.9019607843, alpha: 0.8470588235)
    }
    
    func setDesignStatusBorder() {
        self.layer.cornerRadius = 10
    }
    
    func setWindowBorder() {
    self.layer.cornerRadius = 5
        
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
            DispatchQueue.main.async {
                let path = UIBezierPath(roundedRect: self.bounds,
                                        byRoundingCorners: corners,
                                        cornerRadii: CGSize(width: radius, height: radius))
                let maskLayer = CAShapeLayer()
                maskLayer.frame = self.bounds
                maskLayer.path = path.cgPath
                self.layer.mask = maskLayer
            }
        }
}
    
    
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {

            DispatchQueue.main.async {
                let path = UIBezierPath(roundedRect: self.bounds,
                                        byRoundingCorners: corners,
                                        cornerRadii: CGSize(width: radius, height: radius))
                let maskLayer = CAShapeLayer()
                maskLayer.frame = self.bounds
                maskLayer.path = path.cgPath
                self.layer.mask = maskLayer
            }
        }
    
}



extension UIImageView {
    
    func roundCorner() {
        self.layer.cornerRadius = 5
    }
}
