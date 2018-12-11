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
    
    init(name: String, icon: String) {
        self.name = name
        self.icon = icon
    }
    func printValue() {
        print(">>>\(self.name), >>>\(self.icon)")
    }
}

class DrawerController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var rowItems = [ItemForDrawer]();
    @IBOutlet weak var drawerTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initialData()
    }
    
    func initialData() {
        let names = ["Inbox", "Sent", "Draft", "Settings"]
        let icons = ["inbox_icon", "sent_icon", "draft_icon", "settings_icon"]
        for i in 0 ..< names.count {
            self.rowItems.append(ItemForDrawer(name: names[i], icon: icons[i]))
        }
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
        print("!!!!")
        cell.setDataForRow(data: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
}
