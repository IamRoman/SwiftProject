//
//  DrawerController.swift
//  First_app
//
//  Created by Roman IamRoman on 12/6/18.
//  Copyright © 2018 Roman IamRoman. All rights reserved.
//

import UIKit

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

class DrawerController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var rowItems = [ItemForDrawer]();
    @IBOutlet weak var drawerTableView: UITableView!
    @IBOutlet weak var logoutView: UIView!
    @IBOutlet weak var logoutIcon: UIImageView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
        self.logoutView.addGestureRecognizer(gesture)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.drawerTableView.tableFooterView = UIView()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        ConvertationColors.setTintColor(imageView: self.logoutIcon, color: "#43b7ff")
        HelpersForUIView.setCircleBorder(image: avatarImage)
        
        logoutView.layer.addBorder(edge: [.top], color: UIColor.white, thickness: 1.5)
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
        print("You tapped cell number \(indexPath.row).")
        let secondViewController: UIViewController
        switch indexPath.row {
        case 0:
            secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "InboxViewController") as! InboxViewController
        case 1:
            secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SentViewController") as! SentViewController
        case 2:
            secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "DraftViewController") as! DraftViewController
        case 3:
            secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        default:
           secondViewController = UIViewController()
        }
        Navigation.shared.pushViewController(viewController: secondViewController)
    }
}
