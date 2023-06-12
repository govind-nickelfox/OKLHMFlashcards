//
//  UIString+Helper.swift
//  FireInspection
//
//  Created by Akanksha Trivedi on 16/03/23.
//  Copyright © 2023 Nickelfox. All rights reserved.
//

import Foundation
import UIKit

public extension String {

    func intoAttributedString(attributes: [NSAttributedString.Key: Any?]) -> NSMutableAttributedString{
        let attributedString = NSMutableAttributedString(string: self, attributes: attributes as [NSAttributedString.Key : Any])
        return attributedString
        
    }
    
    var toFloat : Float{
        return Float(self) ?? 0
    }
}

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect,
                                            options: .usesLineFragmentOrigin,
                                            attributes: [NSAttributedString.Key.font: font],
                                            context: nil)

        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude,
                                    height: height)
        let boundingBox = self.boundingRect(with: constraintRect,
                                            options: .usesLineFragmentOrigin,
                                            attributes: [NSAttributedString.Key.font:
                                                            font], context: nil)

        return ceil(boundingBox.width)
    }
}
 
public extension Float {
    
    func string(integerDigits: Int) -> String {
        let formatter = NumberFormatter()
        formatter.maximumIntegerDigits = integerDigits
        formatter.minimumIntegerDigits = integerDigits
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
