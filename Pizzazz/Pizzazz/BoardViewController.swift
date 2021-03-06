//
//  BoardViewController.swift
//  Pizzazz
//
//  Created by Zach Zeleznick on 5/5/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//

import UIKit

class BoardViewController: ViewController {
    
    var tableView: UITableView!
    let cellWrapper = CellWrapper(cell: PostViewCell.self)
    typealias cellType = PostViewCell

    let sections = ["Pinned", "Favorites", "Today", "Yesterday", "This Week", "Older"]
    let sectionRowCount = 3
    let dummyText = "I'm a post"
    let dummyStub = "Donald Drumf, 05/05/2016"
    
    override func addToolbar() {
        let toolbar = UIToolbar()
        toolbar.barTintColor = UIColor(white: 0.95, alpha: 1.0)
        
        let moreButton = UIButton()
        moreButton.setBackgroundImage(UIImage(named: "MoreIcon"),
                                      for: UIControlState())
        moreButton.frame = CGRect(x: 0, y: 0, width: 30, height: 10)

        let composeButton = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(composeButtonPressed))
        composeButton.width = 40
        
        let item1 = UIBarButtonItem(customView: moreButton)
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        toolbar.setItems([item1, spacer, composeButton], animated: true)
        view.addUIElement(toolbar, frame: CGRect(x: 0, y: h-40, width: w, height: 40))
    }
    
    func composeButtonPressed() {
        let dest = NewQuestionViewController()
        navigationController?.pushViewController(dest, animated: true)
    }
    
    func rightButtonPressed() {
        let dest = CourseInfoViewController()
        let title = navigationItem.title!
        let newTitle = "\(title) Course Information"
        dest.navigationItem.title = newTitle
        dest.dummyTitle = "\(title)"
        dest.dummySubtitle = "Description \(title)"
        navigationController?.pushViewController(dest, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let infoButton = UIButton()
        infoButton.setBackgroundImage(UIImage(named: "PaperIcon"), for: UIControlState())
        infoButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        infoButton.addTarget(self, action: #selector(BoardViewController.rightButtonPressed), for: .touchUpInside)
        let infoBar = UIBarButtonItem(customView: infoButton)
        navigationItem.setRightBarButton(infoBar, animated: true)
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: w, height: h-50), controller: self, cellWrapper: cellWrapper)
        view.addSubview(tableView)
        
        addToolbar()
    }
}

extension BoardViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionRowCount
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
            let section = (indexPath as NSIndexPath).section
            let idx = sectionRowCount*section + (indexPath as NSIndexPath).item
            cell.titleLabel.text = "Question \(idx)"
            cell.bodyLabel.text = dummyText
            cell.detailLabel.text = dummyStub
            return cell
    }
    
    
}


