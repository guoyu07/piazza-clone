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
        let w = UIScreen.main.bounds.size.width
        contentView.addUIElement(titleLabel, frame: CGRect(x: 30, y: 8, width: w-30, height: 20))  {element in
            guard let label = element as? UILabel else { return }
            let font = UIFont(name: "Helvetica-Bold", size: 16)
            label.font = font
        }
        contentView.addUIElement(bodyLabel, frame: CGRect(x: 30, y: 25, width: w-30, height: 30))  {element in
            guard let label = element as? UILabel else { return }
            let font = UIFont(name: "HelveticaNeue", size: 16)
            label.font = font
            label.textColor = UIColor(white: 0.5, alpha: 1.0)
        }
        contentView.addUIElement(detailLabel, frame: CGRect(x: 30, y: 60, width: w-50, height: 12))  {element in
            guard let label = element as? UILabel else { return }
            let font = UIFont(name: "HelveticaNeue", size: 12)
            label.font = font
            label.textAlignment = .right
            label.textColor = UIColor(white: 0.5, alpha: 1.0)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
}
