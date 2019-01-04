//
//  RenderSettingsSwitchCell.swift
//  First_app
//
//  Created by Roman IamRoman on 12/17/18.
//  Copyright © 2018 Roman IamRoman. All rights reserved.
//

import UIKit

class RenderSettingsSwitchCell: UITableViewCell {

    @IBOutlet var firstCircle: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        HelpersForUIView.drawBlackBorder(view: firstCircle)//drawBlackBorder(view: firstCircle)
        // Configure the view for the selected state
    }
    
}
