//
//  ClassViewCell.swift
//  Pizzazz
//
//  Created by Zach Zeleznick on 5/5/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//

import Foundation
import UIKit

class ClassViewCell: UITableViewCell {
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let bodyLabel = UILabel()
    let notificationLabel = UILabel()
    let settingsLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let w = UIScreen.mainScreen().bounds.size.width
        contentView.addUIElement(titleLabel, frame: CGRect(x: 25, y: 8, width: w-25, height: 14))  {element in
            guard let label = element as? UILabel else { return }
            let font = UIFont(name: "Helvetica-Bold", size: 14)
            label.font = font
        }
        contentView.addUIElement(subtitleLabel, frame: CGRect(x: 25, y: 25, width: w-25, height: 14))  {element in
            guard let label = element as? UILabel else { return }
            let font = UIFont(name: "HelveticaNeue", size: 13)
            label.font = font
        }
        contentView.addUIElement(bodyLabel, frame: CGRect(x: 25, y: 40, width: w-25, height: 30))  {element in
            guard let label = element as? UILabel else { return }
            let font = UIFont(name: "HelveticaNeue", size: 12)
            label.font = font
            label.textColor = UIColor(white: 0.5, alpha: 1.0)
        }
        contentView.addUIElement(settingsLabel, frame: CGRect(x: 25, y: 82, width: w-25, height: 14))  {element in
            guard let label = element as? UILabel else { return }
            let font = UIFont(name: "HelveticaNeue", size: 12)
            label.font = font
            label.text = "Class Settings"
            label.textColor = UIColor(rgb: 0x2D83BD)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
}