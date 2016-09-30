//
//  ContinuedQuestionViewController.swift
//  Pizzazz
//
//  Created by Zach Zeleznick on 5/6/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//

import UIKit

class ContinuedQuestionViewController: ViewController {
    
    var navBarHeight: CGFloat!
    let navOffset:CGFloat = 20
    
    let folderButton = UIButton()
    let fileButton = UIButton()
    let photoButton = UIButton()
    
    func placeFields() {
        
        let titleFrame = CGRect(x: 20, y: navBarHeight + navOffset+25,
                                width: 120, height: 30)
        view.addUIElement(folderButton, text: "add folder",
                          frame: titleFrame) { element in
            guard let button = element as? UIButton else { return }
            button.setTitleColor(UIColor.blue, for: .normal)
            button.contentHorizontalAlignment = .left
        }
        let sFrame = CGRect(x: 20, y: navBarHeight + navOffset+75,
                            width: 120, height: 30)
        view.addUIElement(fileButton, text: "add file",
                          frame: sFrame) { element in
            guard let button = element as? UIButton else { return }
            button.setTitleColor(UIColor.blue, for: .normal)
            button.contentHorizontalAlignment = .left;
        }
        let tFrame = CGRect(x: 20, y: navBarHeight + navOffset+125,
                            width: 120, height: 30)
        view.addUIElement(photoButton, text: "add photo",
                          frame: tFrame) { element in
            guard let button = element as? UIButton else { return }
            button.setTitleColor(UIColor.blue, for: .normal)
            button.contentHorizontalAlignment = .left;
        }
    }
    func rightButtonPressed() {
        let allVC = self.navigationController?.viewControllers
        if let destVC = allVC![allVC!.count - 2] as? BoardViewController {
            let _ = navigationController?.popToViewController(destVC, animated: true)
        }
        else {
            let _ = navigationController?.popToRootViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "New Question"
        navigationItem.leftBarButtonItem?.title = ""
        navBarHeight = navigationController?.navigationBar.frame.height
        let rightButton = UIButton()
        rightButton.setTitle("Post", for: UIControlState())
        rightButton.titleLabel?.font = UIFont(name: "Helvetica", size: 16)
        rightButton.setTitleColor(UIColor.white, for: UIControlState())
        rightButton.addTarget(self, action: #selector(rightButtonPressed),
                              for: .touchUpInside)
        rightButton.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        
        let rightBar = UIBarButtonItem(customView: rightButton)
        navigationItem.setRightBarButton(rightBar, animated: true)
        placeFields()
    }
    
    
}

