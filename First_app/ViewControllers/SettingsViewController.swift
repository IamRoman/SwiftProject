//
//  SettingsViewController.swift
//  First_app
//
//  Created by Roman IamRoman on 12/12/18.
//  Copyright © 2018 Roman IamRoman. All rights reserved.
//

import UIKit
import RealmSwift

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let realm = try! Realm()
    var items: Results<Item>!
    @IBOutlet weak var tableSentMessage: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        items = realm.objects(Item.self)
        self.tableSentMessage.tableFooterView = UIView();
        //        ServiceRest.getInboxMessage();
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        //        self.tableSentMessage.register(MessageSentCell.self, forCellReuseIdentifier: "MessageSentCell")
    }
    
    func addItems() {
        let firstItem = Item()
        firstItem.name = "First Item"
        
        let secondItem = Item(value: ["name": "secondItem"])
        let therdItem = Item(value: ["name", "secondItem"])
        
        try! realm.write {
            realm.add([firstItem, secondItem, therdItem])
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnShare(_ sender: UIButton) {
        NSLog("share")
        addItems()
        self.tableSentMessage.reloadData()
    }
    
    
    @IBAction func toggleButton(_ sender: UIButton) {
        Navigation.shared.toggleDrawer()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if items.count != 0 {
            return items.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("RenderMessageCell", owner: self, options: nil)?.first as! RenderMessageCell
        let item = items[indexPath.row]
        cell.setDataToRow(data: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editingRow = items[indexPath.row]
        
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { _,_ in
            try! self.realm.write {
                self.realm.delete(editingRow)
                tableView.reloadData()
            }
        }
        return [deleteAction]
    }
}
