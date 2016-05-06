//
//  PostViewCell.swift
//  Pizzazz
//
//  Created by Zach Zeleznick on 5/5/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//
import Foundation
import UIKit

class PostViewCell: UITableViewCell {
    
    let titleLabel = UILabel()
    let bodyLabel = UILabel()
    let detailLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let w = UIScreen.mainScreen().bounds.size.width
        contentView.addUIElement(titleLabel, frame: CGRect(x: 25, y: 8, width: w-25, height: 12))  {element in
            guard let label = element as? UILabel else { return }
            let font = UIFont(name: "Helvetica-Bold", size: 13)
            label.font = font
        }
        contentView.addUIElement(bodyLabel, frame: CGRect(x: 25, y: 20, width: w-25, height: 30))  {element in
            guard let label = element as? UILabel else { return }
            let font = UIFont(name: "HelveticaNeue", size: 12)
            label.font = font
            label.textColor = UIColor(white: 0.5, alpha: 1.0)
        }
        contentView.addUIElement(detailLabel, frame: CGRect(x: 25, y: 60, width: w-50, height: 12))  {element in
            guard let label = element as? UILabel else { return }
            let font = UIFont(name: "HelveticaNeue", size: 10)
            label.font = font
            label.textAlignment = .Right
            label.textColor = UIColor(white: 0.5, alpha: 1.0)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
}