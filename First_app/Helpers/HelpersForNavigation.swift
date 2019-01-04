//
//  HelpersForNavigation.swift
//  First_app
//
//  Created by Roman IamRoman on 12/17/18.
//  Copyright © 2018 Roman IamRoman. All rights reserved.
//

import UIKit

extension UINavigationController {
    func replaceCurrentViewController(with viewController: UIViewController, animated: Bool) {
        pushViewController(viewController, animated: animated)
        let indexToRemove = viewControllers.count - 2
        if indexToRemove >= 0 {
            viewControllers.remove(at: indexToRemove)
        }
    }
}

class HelpersForNavigation: NSObject {

}
