//
//  RenderSettingsCellWithBorder.swift
//  First_app
//
//  Created by Roman IamRoman on 12/17/18.
//  Copyright © 2018 Roman IamRoman. All rights reserved.
//

import UIKit

class RenderSettingsCellWithBorder: UITableViewCell {

    @IBOutlet var contentContainerView: UIView!
    @IBOutlet var labelText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        contentContainerView.layer.addBorder(edge: .top, color: UIColor.lightGray, thickness: 1)
        contentContainerView.layer.addBorder(edge: .bottom, color: UIColor.lightGray, thickness: 1)
    }
    
    func setDataToRow(data: String) {
        labelText.text = data
    }
}
