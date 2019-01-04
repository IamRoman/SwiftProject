//
//  ItemForDrawer.swift
//  First_app
//
//  Created by Roman IamRoman on 12/17/18.
//  Copyright © 2018 Roman IamRoman. All rights reserved.
//

import UIKit

class ItemForDrawer: NSObject {
    var name: String = ""
    var icon: String = ""
    var isSelected: Bool = false
    
    init(name: String, icon: String, isSelected: Bool) {
        self.name = name
        self.icon = icon
        self.isSelected = isSelected
    }
    func printValue() {
        print(">>>\(self.name), >>>\(self.icon), >>>\(self.isSelected)")
    }
    func setSelectedFlag(isSelected: Bool) {
        self.isSelected = isSelected
    }
}
