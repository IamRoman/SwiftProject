//
//  ItemWithIconAndText.swift
//  First_app
//
//  Created by Roman IamRoman on 12/17/18.
//  Copyright © 2018 Roman IamRoman. All rights reserved.
//

import UIKit

class ItemWithIconAndText: NSObject {
    var name: String = ""
    var icon: String = ""
    
    init(name: String, icon: String) {
        self.name = name
        self.icon = icon
    }
    func printValue() {
        print(">>>\(self.name), >>>\(self.icon)")
    }
}
