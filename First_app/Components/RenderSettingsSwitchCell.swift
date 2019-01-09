//
//  RenderSettingsSwitchCell.swift
//  First_app
//
//  Created by Roman IamRoman on 12/17/18.
//  Copyright © 2018 Roman IamRoman. All rights reserved.
//

import UIKit
import DLRadioButton

class RenderSettingsSwitchCell: UITableViewCell {

//    @IBOutlet var radioButton: DLRadioButton!
    @IBOutlet var blueRadioButton: DLRadioButton!
    @IBOutlet var viewContainer: [UIView]!
    @IBOutlet var redRadioButton: DLRadioButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        super.selectionStyle = .none
//        super.isUserInteractionEnabled = false
        super.bringSubview(toFront: self.blueRadioButton)
//        HelpersForUIView.drawCircle(view: firstCircle, borderColor: UIColor.red, bodyColor: UIColor.white)//drawBlackBorder(view: firstCircle)
//        HelpersForUIView.drawCircle(view: secondCircle, borderColor: UIColor.red, bodyColor: UIColor.white)
//        radioButton.isSelected = true
    }
    
    @objc @IBAction private func logSelectedButton(radioButton : DLRadioButton) {
        if (radioButton.isMultipleSelectionEnabled) {
            for button in radioButton.selectedButtons() {
                print(String(format: "%@ is selected.\n", button.titleLabel!.text!));
            }
        } else {
            print(String(format: "%@ is selected.\n", radioButton.selected()!.titleLabel!.text!));
        }
    }
    
}
