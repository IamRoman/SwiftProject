//
//  SettingsViewController.swift
//  First_app
//
//  Created by Roman IamRoman on 12/12/18.
//  Copyright © 2018 Roman IamRoman. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var rowItems = [ItemWithIconAndText]();
    @IBOutlet weak var tableSentMessage: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.tableSentMessage.tableFooterView = UIView();
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        initialData()
    }
    
    func initialData() {
        let icons = ["invite_friends",
                     "edit_profile",
                     "language",
                     "authentication",
                     "buy_pro",
                     "help",
                     "none",
                     "none"]
        let names = ["Invate friends",
                     "Edit profile",
                     "Change application languadge",
                     "Fingerprint authentication",
                     "Go to PRO version",
                     "Help",
                     "Themes",
                     "Switch"]
        for i in 0 ..< names.count {
            if i == 0 {
                self.rowItems.append(ItemWithIconAndText(name: names[i], icon: icons[i]))
            } else {
                self.rowItems.append(ItemWithIconAndText(name: names[i], icon: icons[i]))
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func toggleButton(_ sender: UIButton) {
        Navigation.shared.toggleDrawer()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 7 {
            return 100
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if rowItems.count != 0 {
            return rowItems.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row <= 5 {
            let cell = Bundle.main.loadNibNamed("RenderSettingsCell", owner: self, options: nil)?.first as! RenderSettingsCell
            let item = rowItems[indexPath.row]
            cell.setDataToRow(data: item)
            return cell
        } else if indexPath.row == 6 {
            let cell = Bundle.main.loadNibNamed("RenderSettingsCellWithBorder", owner: self, options: nil)?.first as! RenderSettingsCellWithBorder
            let item = rowItems[indexPath.row]
            cell.setDataToRow(data: item.name)
            return cell
        } else if indexPath.row == 7 {
            let cell = Bundle.main.loadNibNamed("RenderSettingsSwitchCell", owner: self, options: nil)?.first as! RenderSettingsSwitchCell
//        let item = rowItems[indexPath.row]
//        cell.setDataToRow(data: item.name)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.row == 7 {
            let cell = tableView.cellForRow(at: indexPath) as! RenderSettingsSwitchCell
            cell.setSelected(false, animated: true)
//        }
        
        print("You tapped cell number \(indexPath.row).")
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
