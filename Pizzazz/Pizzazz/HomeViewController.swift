//
//  HomeViewController.swift
//  Pizzazz
//
//  Created by Zach Zeleznick on 5/5/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//

import UIKit

class HomeViewController: ViewController {
    
    var tableView: UITableView!

    
    let cellWrapper = CellWrapper(cell: ClassViewCell.self)
    typealias cellType = ClassViewCell
    
    let sections = ["Active Classes", "Inactive Classes"]
    let activeCount = 3
    let inactiveCount = 2
    let dummyText = "University of Drumpf, Main Campus (America, United States of), Spring 2016"
    
    func add() {
        print("add pressed")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Classes"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add,
                                        target: self, action: #selector(add))
        navigationItem.setRightBarButton(addButton, animated: true)
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: w, height: h-50), controller: self, cellWrapper: cellWrapper)
        tableView.rowHeight = 120
        view.addSubview(tableView)
        
        addToolbar()
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
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
            let cell = tableView.dequeueReusableCell(withIdentifier: cellWrapper.identifier, for: indexPath) as! cellType
            cell.selectionStyle = .none
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

