//
//  ViewController.swift
//  Pizzazz
//
//  Created by Zach Zeleznick on 9/29/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var w: CGFloat!
    var h: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        w = view.bounds.size.width
        h = view.bounds.size.height
    }
    
    func addToolbar() {
        let toolbar = UIToolbar()
        toolbar.barTintColor = UIColor(white: 0.95, alpha: 1.0)

        let moreButton = UIButton()
        moreButton.setBackgroundImage(UIImage(named: "MoreIcon"), for: UIControlState())
        moreButton.frame = CGRect(x: 0, y: 0, width: 30, height: 10)
        
        let accountButton = UIButton()
        accountButton.setTitle("Account", for: UIControlState())
        accountButton.titleLabel?.font = UIFont(name: "Helvetica", size: 11)
        accountButton.setTitleColor(UIColor(rgb: 0x3e7aab), for: UIControlState())
        accountButton.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        
        let item1 = UIBarButtonItem(customView: moreButton)
        let item2 = UIBarButtonItem(customView: accountButton)
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                     target: self, action: nil)
        
        toolbar.setItems([item1, spacer, item2], animated: true)
        view.addUIElement(toolbar, frame: CGRect(x: 0, y: h-40, width: w, height: 40))
    }

}
