//
//  HomeViewController.swift
//  Pizzazz
//
//  Created by Zach Zeleznick on 5/5/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,
    UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    var w: CGFloat!
    var h: CGFloat!
    
    typealias CellType = ClassViewCell
    fileprivate struct Main {
        static let CellIdentifier = "cell"
        static let CellClass = ClassViewCell.self
    }
    
    let sections = ["Active Classes", "Inactive Classes"]
    let activeCount = 3
    let inactiveCount = 2
    let dummyText = "University of Drumpf, Main Campus (America, United States of), Spring 2016"
    
    func add() {
        print("add pressed")
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
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        toolbar.setItems([item1, spacer, item2], animated: true)
        view.addUIElement(toolbar, frame: CGRect(x: 0, y: h-40, width: w, height: 40))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        
        w = view.bounds.size.width
        h = view.bounds.size.height
        navigationItem.title = "Classes"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(HomeViewController.add))
        navigationItem.setRightBarButton(addButton, animated: true)
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: w, height: h-50))
        tableView.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(Main.CellClass,
                                forCellReuseIdentifier: Main.CellIdentifier)
        // tableView.separatorStyle = .None
        tableView.rowHeight = 120
        view.addSubview(tableView)
        addToolbar()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return activeCount
        }
        else {
            return inactiveCount
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 32
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderViewCell()
        let text = sections[section]
        headerView.titleLabel.text = text
        return headerView
    }
    
    func tableView(_ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: Main.CellIdentifier, for: indexPath) as! CellType
            // cell.selectionStyle = .None
            let section = (indexPath as NSIndexPath).section
            var idx = 0
            if section == 0 {
                idx = (indexPath as NSIndexPath).item
            }
            else {
                idx = activeCount + (indexPath as NSIndexPath).item
            }
            let title = "Class \(idx)"
            cell.titleLabel.text = title
            cell.subtitleLabel.text = "Class Description \(idx)"
            cell.bodyLabel.text = dummyText
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dest = BoardViewController()
        let section = (indexPath as NSIndexPath).section
        var idx = 0
        if section == 0 {
            idx = (indexPath as NSIndexPath).item
        }
        else {
            idx = activeCount + (indexPath as NSIndexPath).item
        }
        let title = "Class \(idx)"
        let titleText = title
        dest.navigationItem.title = titleText
        navigationController?.pushViewController(dest, animated: true)
    }


}

