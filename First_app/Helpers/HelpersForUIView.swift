//
//  HelpersForUIView.swift
//  First_app
//
//  Created by Roman IamRoman on 12/14/18.
//  Copyright © 2018 Roman IamRoman. All rights reserved.
//

import UIKit

extension CALayer {
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        let border = CALayer()
        switch edge {
        case .top:
            border.frame = CGRect(x: 0, y: 0, width: frame.width, height: thickness)
        case .bottom:
            border.frame = CGRect(x: 0, y: frame.height - thickness, width: frame.width, height: thickness)
        case .left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: frame.height)
        case .right:
            border.frame = CGRect(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)
        default:
            break
        }
        
        border.backgroundColor = color.cgColor;
        addSublayer(border)
    }
}

class HelpersForUIView: NSObject {
    static func setCircleBorder(image: UIImageView) {
        image.layer.borderWidth = 1;
        image.layer.borderColor = UIColor(red:0.25, green:0.74, blue:0.96, alpha:1.0).cgColor;
        image.layer.masksToBounds = false;
        image.layer.cornerRadius = image.frame.height/2;
        image.clipsToBounds = true;
    }
    
    static func drawCircle(view: UIView, borderColor: UIColor, bodyColor: UIColor) {
        let circleWidth = 28
        let myNewView = UIView(frame: CGRect(x: -5, y: -5, width: circleWidth, height: circleWidth))
        myNewView.backgroundColor = UIColor.clear
        myNewView.layer.cornerRadius = CGFloat(circleWidth/2)
        myNewView.layer.borderWidth = 3
        myNewView.layer.borderColor = UIColor.blue.cgColor
        view.addSubview(myNewView)
        
//        view.layer.borderColor = borderColor.cgColor
//        view.layer.borderWidth = 3.0
        
        view.layer.cornerRadius = view.frame.size.width/2.0
        view.backgroundColor = bodyColor
    }
}
