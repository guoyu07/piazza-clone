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
    
    typealias CellType = PostViewCell
    private struct Main {
        static let CellIdentifier = "cell"
        static let CellClass = PostViewCell.self
    }
    let sections = ["Pinned", "Favorites", "Today", "Yesterday", "This Week", "Older"]
    let dummyTitles = ["Question 1", "Question 2", "Question 3"]
    let dummyText = "I'm a post"
    let dummyStub = "Donald Drumf, 05/05/2016"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = UIView(frame: UIScreen.mainScreen().bounds)
        view.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        
        let w = view.bounds.size.width
        let h = view.bounds.size.height
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: w, height: h))
        tableView.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(Main.CellClass,
            forCellReuseIdentifier: Main.CellIdentifier)
        tableView.rowHeight = 80
        view.addSubview(tableView)
        
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


