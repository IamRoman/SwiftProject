//
//  MessageInboxTableViewCell.swift
//  First_app
//
//  Created by Roman IamRoman on 10/17/18.
//  Copyright © 2018 Roman IamRoman. All rights reserved.
//

import UIKit

class MessageInboxTableViewCell: UITableViewCell {

    @IBOutlet weak var lableText: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib();
        avatar.layer.borderWidth = 1;
        avatar.layer.borderColor = UIColor(red:0.25, green:0.74, blue:0.96, alpha:1.0).cgColor;
        avatar.layer.masksToBounds = false;
        avatar.layer.cornerRadius = avatar.frame.height/2;
        avatar.clipsToBounds = true;
        
        let screenSize = UIScreen.main.bounds
        let separatorHeight = CGFloat(3.0)
        let additionalSeparator = UIView.init(frame: CGRect(x: 0, y: self.frame.size.height-separatorHeight, width: screenSize.width, height: separatorHeight))
        additionalSeparator.backgroundColor = hexStringToUIColor(hex: "#262626")
        self.addSubview(additionalSeparator)
        // Initialization code
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDataToRow(data: Item) {
//        print(">>>>\(data)")
        lableText.text = data.name
    }
}
