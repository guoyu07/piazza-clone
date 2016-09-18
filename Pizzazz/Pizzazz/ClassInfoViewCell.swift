//
//  ClassInfoViewCell.swift
//  Pizzazz
//
//  Created by Zach Zeleznick on 5/6/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//

import Foundation
import UIKit

class ClassInfoViewCell: UITableViewCell {
    
    var w: CGFloat!
    
    var lines: [String]! {
        willSet(values) {
            for (idx, name) in values.enumerated() {
                let label = UILabel()
                let font = UIFont(name: "Helvetica", size: 12)
                label.font = font
                let y:CGFloat = 22*CGFloat(idx) + 5.0
                let labelFrame = CGRect(x: 25, y: y, width: w-25, height: 20)
                contentView.addUIElement(label, text: name, frame: labelFrame) { _ in
                    // print("Adding \(name)")
                }
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        w = UIScreen.main.bounds.size.width
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
}
