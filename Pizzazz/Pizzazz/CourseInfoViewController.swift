//
//  CourseInfoViewController.swift
//  Pizzazz
//
//  Created by Zach Zeleznick on 5/6/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//
import UIKit

class CourseInfoViewController: ViewController {
    
    var tableView: UITableView!
    
    typealias CellType = ClassViewCell
    fileprivate struct Main {
        static let CellIdentifier = "cell"
        static let CellClass = CellType.self
    }
    typealias InfoCellType = ClassInfoViewCell
    fileprivate struct Info {
        static let CellIdentifier = "infoCell"
        static let CellClass = InfoCellType.self
    }
    typealias SecondaryCellType = StaffViewCell
    fileprivate struct Secondary {
        static let CellIdentifier = "staffCell"
        static let CellClass = SecondaryCellType.self
    }
    let sections = ["Course Information", "General Information", "Staff",] //"Resources"]
    var dummyTitle: String! = "Class 0"
    var dummySubtitle: String! = "Description Class 0"
    let dummyText = "University of Drumpf, Main Campus (America, United States of), Spring 2016"
    let info = ["This is a class description", "This is a second line about the class"]
    let staffNames = ["John Dermot", "Brianna Radnovich", "Nikolas Thomas",
                        "Sarah Beekman", "Diana Marshall"]
    
    override func addToolbar() {
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
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: w, height: h-50))
        tableView.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(Main.CellClass,
                           forCellReuseIdentifier: Main.CellIdentifier)
        tableView.register(Info.CellClass,
                           forCellReuseIdentifier: Info.CellIdentifier)
        tableView.register(Secondary.CellClass,
                           forCellReuseIdentifier: Secondary.CellIdentifier)
        tableView.rowHeight = 90
        view.addSubview(tableView)
        
        addToolbar()
        
    }
}

extension CourseInfoViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 32
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = (indexPath as NSIndexPath).section
        if section == 1{
            return 80
        }
        else if section == 2 {
            return 120
        }
        return 100
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderViewCell()
        let text = sections[section]
        headerView.titleLabel.text = text
        return headerView
    }
    
    func tableView(_ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let section = (indexPath as NSIndexPath).section
            if section == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: Info.CellIdentifier, for: indexPath) as! InfoCellType
                cell.selectionStyle = .none
                cell.lines = info
                return cell
            }
            else if section == 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: Secondary.CellIdentifier, for: indexPath) as! SecondaryCellType
                cell.selectionStyle = .none
                cell.names = staffNames
                return cell
            }
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: Main.CellIdentifier, for: indexPath) as! CellType
                cell.selectionStyle = .none
                cell.titleLabel.text = dummyTitle
                cell.subtitleLabel.text = dummySubtitle
                cell.bodyLabel.text = dummyText
                cell.hideSettings()
                return cell
            }
    }
    
    
}

