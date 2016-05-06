//
//  CourseInfoViewController.swift
//  Pizzazz
//
//  Created by Zach Zeleznick on 5/6/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//
import UIKit

class CourseInfoViewController: UIViewController,
    UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    var w: CGFloat!
    var h: CGFloat!
    
    typealias CellType = ClassViewCell
    private struct Main {
        static let CellIdentifier = "cell"
        static let CellClass = ClassViewCell.self
    }
    typealias InfoCellType = ClassInfoViewCell
    private struct Info {
        static let CellIdentifier = "infoCell"
        static let CellClass = ClassInfoViewCell.self
    }
    typealias SecondaryCellType = StaffViewCell
    private struct Secondary {
        static let CellIdentifier = "staffCell"
        static let CellClass = StaffViewCell.self
    }
    let sections = ["Course Information", "General Information", "Staff",] //"Resources"]
    var dummyTitle: String! = "Class 0"
    var dummySubtitle: String! = "Description Class 0"
    let dummyText = "University of Drumpf, Main Campus (America, United States of), Spring 2016"
    let info = ["This is a class description", "This is a second line about the class"]
    let staffNames = ["John Dermot", "Brianna Radnovich", "Nikolas Thomas",
                        "Sarah Beekman", "Diana Marshall"]
    
    func addToolbar() {
        let toolbar = UIToolbar()
        toolbar.barTintColor = UIColor(white: 0.95, alpha: 1.0)
        view.addUIElement(toolbar, frame: CGRect(x: 0, y: h-40, width: w, height: 40))
    }
    
    func composeButtonPressed() {
        let dest = NewQuestionViewController()
        navigationController?.pushViewController(dest, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = UIView(frame: UIScreen.mainScreen().bounds)
        view.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        w = view.bounds.size.width
        h = view.bounds.size.height
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: w, height: h-50))
        tableView.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(Main.CellClass,
            forCellReuseIdentifier: Main.CellIdentifier)
        tableView.registerClass(Info.CellClass,
            forCellReuseIdentifier: Info.CellIdentifier)
        tableView.registerClass(Secondary.CellClass,
            forCellReuseIdentifier: Secondary.CellIdentifier)
        tableView.rowHeight = 90
        view.addSubview(tableView)
        addToolbar()
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 32
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let section = indexPath.section
        if section == 1{
            return 80
        }
        else if section == 2 {
            return 120
        }
        return 100
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderViewCell()
        let text = sections[section]
        headerView.titleLabel.text = text
        return headerView
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let section = indexPath.section
            if section == 1 {
                let cell = tableView.dequeueReusableCellWithIdentifier(Info.CellIdentifier, forIndexPath: indexPath) as! InfoCellType
                cell.selectionStyle = .None
                cell.lines = info
                return cell
            }
            else if section == 2 {
                let cell = tableView.dequeueReusableCellWithIdentifier(Secondary.CellIdentifier, forIndexPath: indexPath) as! SecondaryCellType
                cell.selectionStyle = .None
                cell.names = staffNames
                return cell
            }
            else {
                let cell = tableView.dequeueReusableCellWithIdentifier(Main.CellIdentifier, forIndexPath: indexPath) as! CellType
                cell.selectionStyle = .None
                cell.titleLabel.text = dummyTitle
                cell.subtitleLabel.text = dummySubtitle
                cell.bodyLabel.text = dummyText
                cell.hideSettings()
                return cell
            }
    }
    
    
}

