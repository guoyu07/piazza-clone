//
//  HeaderViewCell.swift
//  Pizzazz
//
//  Created by Zach Zeleznick on 5/6/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//

import Foundation

import UIKit

class HeaderViewCell: UITableViewCell {
    
    let titleLabel = UILabel()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let w = UIScreen.main.bounds.size.width
        contentView.backgroundColor = UIColor(rgb: 0xeff0f1)
        contentView.addUIElement(titleLabel, frame: CGRect(x: 30, y: 6, width: w-30, height: 20))  {element in
            guard let label = element as? UILabel else { return }
            let font = UIFont(name: "HelveticaNeue", size: 13)
            label.font = font
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
}
