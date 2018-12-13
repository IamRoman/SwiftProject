//
//  RenderDrawerRow.swift
//  First_app
//
//  Created by Roman IamRoman on 12/10/18.
//  Copyright © 2018 Roman IamRoman. All rights reserved.
//

import UIKit

enum ColorPalette {
    static let Selected = "#fff"
    static let Unselected = "#000000"
}

extension UIImage {
    func imageWithColor(color1: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        color1.setFill()
        
        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0, y: self.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        context?.setBlendMode(CGBlendMode.normal)
        
        let rect = CGRect(origin: .zero, size: CGSize(width: self.size.width, height: self.size.height))
        context?.clip(to: rect, mask: self.cgImage!)
        context?.fill(rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}


class RenderDrawerRow: UITableViewCell {
    
    @IBOutlet weak var rowImage: UIImageView!
    @IBOutlet weak var rowName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        ConvertationColors.setTintColor(imageView: self.rowImage, color: "#43b7ff")
    }
    
//    func setTintColor(imageView: UIImageView, color: String) {
//        imageView.image = imageView.image!.withRenderingMode(.alwaysTemplate)
//        imageView.tintColor = ConvertationColors.hexStringToUIColor(hex: color)
//    }
    
    func setDataForRow (data: ItemForDrawer)  {
        self.rowName.text = data.name
        self.rowImage.image = UIImage(named: data.icon)
    }
    func setImageColor(colorHex: String) {
        self.rowImage.image = self.rowImage.image?.imageWithColor(color1: UIColor.blue)
    }
}
