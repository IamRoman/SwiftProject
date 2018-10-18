//
//  ViewController.swift
//  First_app
//
//  Created by Roman IamRoman on 10/17/18.
//  Copyright © 2018 Roman IamRoman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var messageInbox: UITableView!
    let animals: [String] = ["Horse", "Cow", "Camel", "Sheep", "Goat"];
    let cellReuseIdentifier = "tableInboxMess"
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.messageInbox.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier);
        messageInbox.delegate = self;
        messageInbox.dataSource = self;
        self.messageInbox.tableFooterView = UIView();
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnShare(_ sender: UIButton) {
        NSLog("share");
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.animals.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = self.messageInbox.dequeueReusableCell(withIdentifier: "messageInboxTableViewCell") as! MessageInboxTableViewCell!
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
}

