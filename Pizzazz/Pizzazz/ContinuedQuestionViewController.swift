//
//  ContinuedQuestionViewController.swift
//  Pizzazz
//
//  Created by Zach Zeleznick on 5/6/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//

import UIKit

class ContinuedQuestionViewController: UIViewController, UITextViewDelegate {
    
    var w: CGFloat!
    var h: CGFloat!
    var navBarHeight: CGFloat!
    let navOffset:CGFloat = 20
    
    let folderButton = UIButton()
    let fileButton = UIButton()
    let photoButton = UIButton()
    
    func placeFields() {
        print(navBarHeight)
        let titleFrame = CGRect(x: 20, y: navBarHeight + navOffset+5, width: w-20, height: 40)
        view.addUIElement(folderButton, text: "Add Folder", frame: titleFrame) { element in
            guard let myInput = element as? UITextField else { return }
        }
        let bodyFrame = CGRect(x: 18, y: navBarHeight + navOffset+46, width: w-18, height: h - (navBarHeight + navOffset + 60))
        view.addUIElement(fileButton, text: "Add a File", frame: bodyFrame) { element in
            guard let myInput = element as? UITextView else { return }
            // myInput.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
            myInput.textColor = UIColor.lightGray
            myInput.font = UIFont(name: "Helvetica", size: 16)
            myInput.delegate = self
        }
    }
    func rightButtonPressed() {
        let allVC = self.navigationController?.viewControllers
        if let destVC = allVC![allVC!.count - 2] as? BoardViewController {
            navigationController?.popToViewController(destVC, animated: true)
        }
        else {
             navigationController?.popToRootViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        w = view.bounds.size.width
        h = view.bounds.size.height
        navigationItem.title = "New Question"
        navBarHeight = navigationController?.navigationBar.frame.height
        let rightButton = UIButton()
        rightButton.setTitle("Post", for: UIControlState())
        rightButton.titleLabel?.font = UIFont(name: "Helvetica", size: 16)
        rightButton.setTitleColor(UIColor.white, for: UIControlState())
        rightButton.addTarget(self, action: #selector(ContinuedQuestionViewController.rightButtonPressed), for: .touchUpInside)
        rightButton.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        
        let rightBar = UIBarButtonItem(customView: rightButton)
        navigationItem.setRightBarButton(rightBar, animated: true)
        placeFields()
    }
    
    
}

