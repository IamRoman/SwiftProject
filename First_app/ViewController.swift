//
//  ViewController.swift
//  First_app
//
//  Created by Roman IamRoman on 10/17/18.
//  Copyright © 2018 Roman IamRoman. All rights reserved.
//

import UIKit
import RealmSwift

class Item: Object {
    @objc dynamic var name = ""
    @objc dynamic var discription = ""
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var messageInbox: UITableView!
    let realm = try! Realm()
    var items: Results<Item>!
    @IBOutlet weak var tableView: UITableView!
    
    var animals: [String] = ["Horse", "Cow", "Camel", "Sheep", "Goat"];
    let cellReuseIdentifier = "tableInboxMess"
    
    override func viewDidLoad() {
        super.viewDidLoad();
        items = realm.objects(Item.self)
//        self.messageInbox.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier);
        messageInbox.delegate = self;
        messageInbox.dataSource = self;
        self.messageInbox.tableFooterView = UIView();
//        ServiceRest.getInboxMessage();
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.setNavigationBarHidden(true, animated: false)
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
        self.tableView.reloadData()
    }
    
    
    @IBAction func toggleButton(_ sender: UIButton) {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if items.count != 0 {
            return items.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageInboxTableViewCell", for: indexPath) as! MessageInboxTableViewCell
        let item = items[indexPath.row]
        cell.setDataToRow(data: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }

//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            self.items.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .none)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
//    }
    
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

