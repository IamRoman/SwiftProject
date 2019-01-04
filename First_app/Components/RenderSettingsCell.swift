//
//  RenderSettingsCell.swift
//  First_app
//
//  Created by Roman IamRoman on 12/17/18.
//  Copyright © 2018 Roman IamRoman. All rights reserved.
//

import UIKit

class RenderSettingsCell: UITableViewCell {

    @IBOutlet weak var iconRow: UIImageView!
    @IBOutlet weak var labelRow: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setDataToRow(data: ItemWithIconAndText) {
        self.labelRow.text = data.name
        self.iconRow.image = UIImage(named: data.icon)
    }
    
}
