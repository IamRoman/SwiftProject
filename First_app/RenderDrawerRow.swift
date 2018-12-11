//
//  RenderDrawerRow.swift
//  First_app
//
//  Created by Roman IamRoman on 12/10/18.
//  Copyright © 2018 Roman IamRoman. All rights reserved.
//

import UIKit

class RenderDrawerRow: UITableViewCell {
    
    @IBOutlet weak var rowImage: UIImageView!
    @IBOutlet weak var rowName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDataForRow (data: ItemForDrawer)  {
        print(">>>Drawer\(data.name)")
        self.rowName.text = data.name
    }

}
