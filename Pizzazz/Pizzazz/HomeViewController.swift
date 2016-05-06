//
//  HomeViewController.swift
//  Pizzazz
//
//  Created by Zach Zeleznick on 5/5/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    
    typealias CellType = ClassViewCell
    private struct Main {
        static let CellIdentifier = "cell"
        static let CellClass = ClassViewCell.self
    }
    
     let sections = ["Active Classes", "Inactive Classes"]
     let dummyTitles = ["Class 1", "Class 2", "Class 3"]
     let dummySubtitles = ["Class One", "Class Two", "Class Three"]
     let dummyText = "University of Drumpf, Main Campus (America, United States of), Spring 2016"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = UIView(frame: UIScreen.mainScreen().bounds)
        view.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        
        let w = view.bounds.size.width
        let h = view.bounds.size.height
        navigationItem.title = "Classes"
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: w, height: h))
        // want y= 20 if no navigation
        tableView.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(Main.CellClass,
                                forCellReuseIdentifier: Main.CellIdentifier)
        // tableView.separatorStyle = .None
        tableView.rowHeight = 102
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
            cell.subtitleLabel.text = dummySubtitles[indexPath.item]
            cell.bodyLabel.text = dummyText
            return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let dest = BoardViewController()
        let titleText = dummyTitles[indexPath.item]
        dest.navigationItem.title = titleText
        navigationController?.pushViewController(dest, animated: true)
    }


}

