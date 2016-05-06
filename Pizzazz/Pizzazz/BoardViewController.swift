//
//  BoardViewController.swift
//  Pizzazz
//
//  Created by Zach Zeleznick on 5/5/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//

import UIKit

class BoardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    var w: CGFloat!
    var h: CGFloat!
    
    typealias CellType = PostViewCell
    private struct Main {
        static let CellIdentifier = "cell"
        static let CellClass = PostViewCell.self
    }
    let sections = ["Pinned", "Favorites", "Today", "Yesterday", "This Week", "Older"]
    let dummyTitles = ["Question 1", "Question 2", "Question 3"]
    let dummyText = "I'm a post"
    let dummyStub = "Donald Drumf, 05/05/2016"
    
    func addToolbar() {
        let toolbar = UIToolbar()
        toolbar.barTintColor = UIColor(white: 0.95, alpha: 1.0)
        
        let moreButton = UIButton()
        moreButton.setBackgroundImage(UIImage(named: "MoreIcon"), forState: .Normal)
        moreButton.frame = CGRect(x: 0, y: 0, width: 21, height: 7)
        moreButton.addTarget(self, action: nil, forControlEvents: .TouchUpInside)
        
        let composeButton = UIBarButtonItem(barButtonSystemItem: .Compose, target: self, action: nil)
        composeButton.width = 40
        
        let item1 = UIBarButtonItem(customView: moreButton)
        let spacer = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: self, action: nil)
        
        toolbar.setItems([item1, spacer, composeButton], animated: true)
        view.addUIElement(toolbar, frame: CGRect(x: 0, y: h-30, width: w, height: 30))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = UIView(frame: UIScreen.mainScreen().bounds)
        view.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        
        w = view.bounds.size.width
        h = view.bounds.size.height
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: w, height: h))
        tableView.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(Main.CellClass,
            forCellReuseIdentifier: Main.CellIdentifier)
        tableView.rowHeight = 80
        view.addSubview(tableView)
        addToolbar()
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyTitles.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UITableViewCell()
        headerView.backgroundColor = UIColor(rgb: 0xeff0f1)
        let text = sections[section]
        let font = UIFont(name: "HelveticaNeue", size: 12)
        headerView.textLabel?.text = text
        headerView.textLabel?.font = font
        return headerView
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier(Main.CellIdentifier, forIndexPath: indexPath) as! CellType
            // cell.selectionStyle = .None
            // let section = indexPath.section
            cell.titleLabel.text = dummyTitles[indexPath.item]
            cell.bodyLabel.text = dummyText
            cell.detailLabel.text = dummyStub
            return cell
    }
    
    
}


