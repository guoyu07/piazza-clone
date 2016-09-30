//
//  NewQuestionViewController.swift
//  Pizzazz
//
//  Created by Zach Zeleznick on 5/6/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//
import UIKit

class NewQuestionViewController: ViewController, UITextViewDelegate {

    var navBarHeight: CGFloat!
    let navOffset:CGFloat = 20
    
    var questionTitle = UITextField()
    var questionBody = UITextView()
    let bodyPlaceholder = "Question Details"

    func placeFields() {
        let titleFrame = CGRect(x: 20, y: navBarHeight + navOffset+5, width: w-20, height: 40)
        view.addUIElement(questionTitle, text: "Question Summary", frame: titleFrame) { element in
            guard let myInput = element as? UITextField else { return }
            self.view.addBorder(myInput)
        }
        let bodyFrame = CGRect(x: 18, y: navBarHeight + navOffset+46, width: w-18, height: h - (navBarHeight + navOffset + 60))
        view.addUIElement(questionBody, text: bodyPlaceholder, frame: bodyFrame) { element in
            guard let myInput = element as? UITextView else { return }
            // myInput.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
            myInput.textColor = UIColor.lightGray
            myInput.font = UIFont(name: "Helvetica", size: 16)
            self.view.addBorder(myInput)
            myInput.delegate = self
        }
    }
    
    func rightButtonPressed() {
        let dest = ContinuedQuestionViewController()
        navigationController?.pushViewController(dest, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "New Question"
        navBarHeight = navigationController?.navigationBar.frame.height
        
        let rightButton = UIButton()
        rightButton.setTitle("Next", for: UIControlState())
        rightButton.titleLabel?.font = UIFont(name: "Helvetica", size: 16)
        rightButton.setTitleColor(UIColor.white, for: UIControlState())
        rightButton.addTarget(self, action: #selector(rightButtonPressed),
                              for: .touchUpInside)
        rightButton.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        
        let rightBar = UIBarButtonItem(customView: rightButton)
        navigationItem.setRightBarButton(rightBar, animated: true)
        placeFields()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if (questionBody.text == bodyPlaceholder) {
            questionBody.text = nil
            questionBody.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if questionBody.text.isEmpty {
            questionBody.text = bodyPlaceholder
            questionBody.textColor = UIColor.lightGray
        }
        textView.resignFirstResponder()
    }

}

