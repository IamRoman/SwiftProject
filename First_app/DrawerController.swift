//
//  DrawerController.swift
//  First_app
//
//  Created by Roman IamRoman on 12/6/18.
//  Copyright © 2018 Roman IamRoman. All rights reserved.
//

import UIKit
//import RealmSwift

enum Icons: String {
    case inbox_icon
    case sent_icon
    case draft_icon
    case settings_icon
}

enum Items: String {
    case Inbox
    case Sent
    case Draft
    case Settings
}

class ItemForDrawer: NSObject {
    var name: String = ""
    var icon: String = ""
    var isSelected: Bool = false
    
    init(name: String, icon: String, isSelected: Bool) {
        self.name = name
        self.icon = icon
        self.isSelected = isSelected
    }
    func printValue() {
        print(">>>\(self.name), >>>\(self.icon), >>>\(self.isSelected)")
    }
    func setSelectedFlag(isSelected: Bool) {
        self.isSelected = isSelected
    }
}

class DrawerController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var rowItems = [ItemForDrawer]();
    @IBOutlet weak var drawerTableView: UITableView!
    @IBOutlet weak var logoutView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
        self.logoutView.addGestureRecognizer(gesture)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.drawerTableView.tableFooterView = UIView()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
//        self.drawerTableView.select
        initialData()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func initialData() {
        let names = ["Inbox", "Sent", "Draft", "Settings"]
        let icons = ["inbox_icon", "sent_icon", "draft_icon", "settings_icon"]
        for i in 0 ..< names.count {
            if i == 0 {
                self.rowItems.append(ItemForDrawer(name: names[i], icon: icons[i], isSelected: true))
            } else {
                self.rowItems.append(ItemForDrawer(name: names[i], icon: icons[i], isSelected: false))
            }
        }
    }
    
    @objc func checkAction(sender : UITapGestureRecognizer) {
        // Do what you want
        print(">>> click")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if rowItems.count != 0 {
            return rowItems.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RenderDrawerRow", for: indexPath) as! RenderDrawerRow
        let item = rowItems[indexPath.row]
        cell.setDataForRow(data: item)
        if 0 == indexPath.row {
            tableView.selectRow(at: indexPath, animated: false, scrollPosition: UITableViewScrollPosition.none)
        }
        let backgroundView = UIView()
        backgroundView.backgroundColor = ConvertationColors.hexStringToUIColor(hex: "#363636")
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("You tapped cell number \(indexPath.row).")
        let cell = tableView.dequeueReusableCell(withIdentifier: "RenderDrawerRow", for: indexPath) as! RenderDrawerRow
        cell.contentView.backgroundColor = UIColor.blue
//        for i in 0 ..< rowItems.count {
//            if i == indexPath.row {
//                cell.setImageColor(colorHex: "#262626")
//            } else {
//                cell.setImageColor(colorHex: "#ffffff")
//            }
//        }
    }
}
