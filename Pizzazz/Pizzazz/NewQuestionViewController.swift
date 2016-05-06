//
//  NewQuestionViewController.swift
//  Pizzazz
//
//  Created by Zach Zeleznick on 5/6/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//
import UIKit

class NewQuestionViewController: UIViewController, UITextViewDelegate {
    
    var w: CGFloat!
    var h: CGFloat!
    var navBarHeight: CGFloat!
    let navOffset:CGFloat = 20
    
    var questionTitle = UITextField()
    var questionBody = UITextView()
    let bodyPlaceholder = "Question Details"
    
    func addBorder<T: UIView>(myInput: T) {
        let border = CALayer()
        border.backgroundColor = UIColor(rgb: 0xCDCDCD).CGColor
        border.frame = CGRect(x:0, y:myInput.frame.size.height-2,
            width: myInput.frame.size.width, height: 1)
        myInput.layer.addSublayer(border)
    }
    
    func placeFields() {
        print(navBarHeight)
        let titleFrame = CGRect(x: 20, y: navBarHeight + navOffset+5, width: w-20, height: 40)
        view.addUIElement(questionTitle, text: "Question Summary", frame: titleFrame) { element in
            guard let myInput = element as? UITextField else { return }
            self.addBorder(myInput)
        }
        let bodyFrame = CGRect(x: 18, y: navBarHeight + navOffset+46, width: w-18, height: h - (navBarHeight + navOffset + 60))
        view.addUIElement(questionBody, text: bodyPlaceholder, frame: bodyFrame) { element in
            guard let myInput = element as? UITextView else { return }
            // myInput.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
            myInput.textColor = UIColor.lightGrayColor()
            myInput.font = UIFont(name: "Helvetica", size: 16)
            self.addBorder(myInput)
            myInput.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = UIView(frame: UIScreen.mainScreen().bounds)
        view.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        
        w = view.bounds.size.width
        h = view.bounds.size.height
        navigationItem.title = "New Question"
        navBarHeight = navigationController?.navigationBar.frame.height
        let accountButton = UIButton()
        accountButton.setTitle("Next", forState: .Normal)
        accountButton.titleLabel?.font = UIFont(name: "Helvetica", size: 16)
        accountButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        accountButton.addTarget(self, action: nil, forControlEvents: .TouchUpInside)
        accountButton.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        
        let accountBar = UIBarButtonItem(customView: accountButton)
        navigationItem.setRightBarButtonItem(accountBar, animated: true)
        placeFields()
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        if (questionBody.text == bodyPlaceholder) {
            questionBody.text = nil
            questionBody.textColor = UIColor.blackColor()
        }
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        if questionBody.text.isEmpty {
            questionBody.text = bodyPlaceholder
            questionBody.textColor = UIColor.lightGrayColor()
        }
        textView.resignFirstResponder()
    }

}

