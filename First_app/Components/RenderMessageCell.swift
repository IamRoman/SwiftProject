//
//  RenderMessageCell.swift
//  First_app
//
//  Created by Roman IamRoman on 12/13/18.
//  Copyright © 2018 Roman IamRoman. All rights reserved.
//

import UIKit

class RenderMessageCell: UITableViewCell {

    @IBOutlet weak var lableText: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        HelpersForUIView.setCircleBorder(image: avatar)
        
        let screenSize = UIScreen.main.bounds
        let separatorHeight = CGFloat(3.0)
        let additionalSeparator = UIView.init(frame: CGRect(x: 0, y: self.frame.size.height-separatorHeight, width: screenSize.width, height: separatorHeight))
        additionalSeparator.backgroundColor = ConvertationColors.hexStringToUIColor(hex: "#262626")
        self.addSubview(additionalSeparator)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setDataToRow(data: Item) {
        lableText.text = data.name
    }
    
}
