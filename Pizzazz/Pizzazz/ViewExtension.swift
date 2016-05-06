//
//  ViewExtension.swift
//  Pizzazz
//
//  Created by Zach Zeleznick on 5/5/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//

//  font helper: http://iosfonts.com/

import Foundation
import UIKit

extension UIView {
    
    func placeUIElement<T: UIView>(element: T, frame: CGRect) {
        // print(frame)
        element.frame = frame
        self.addSubview(element)
    }
    
    func addUIElement<T: UIView>(element: T, text: String? = nil, frame: CGRect, onSuccess: (AnyObject)->() = {_ in } ){
        switch element {
        case let label as UILabel:
            label.text = text
            label.numberOfLines = 0
        case let field as UITextField:
            field.placeholder = text
        case let field as UITextView:
            field.text = text
        case let button as UIButton:
            button.setTitle(text, forState: .Normal)
        case let image as UIImageView:
            image.contentMode = .ScaleAspectFill
            image.clipsToBounds = true
        case _ as UICollectionView:
            break // pass
        case let container as UIVisualEffectView:
            container.effect =  UIBlurEffect(style: UIBlurEffectStyle.Light)
        default:
            break // print("I don't know my type")
        }
        placeUIElement(element, frame: frame)
        onSuccess(element)
    }
}


extension UIColor{
    convenience init(rgb: UInt, alphaVal: CGFloat? = 1.0) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(alphaVal!)
        )
    }
}

extension UISwipeGestureRecognizerDirection: CustomStringConvertible {
    public var description: String {
        // print(self.rawValue)
        switch self.rawValue {
        case 1 << 0: return "Right"
        case 1 << 1: return "Left"
        case 1 << 2: return "Up"
        case 1 << 3: return "Down"
        default: return "Unknown"
        }
    }
}