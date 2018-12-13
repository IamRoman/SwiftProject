//
//  Navigation.swift
//  First_app
//
//  Created by Roman IamRoman on 12/12/18.
//  Copyright © 2018 Roman IamRoman. All rights reserved.
//

import UIKit

class Navigation: NSObject {
    static let shared = Navigation()
    var centerContainer: MMDrawerController?
    
    override init(){
    }
    
    func setupNavigation() -> MMDrawerController {
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let centerViewController = mainStoryBoard.instantiateViewController(withIdentifier: "InboxViewController") as! InboxViewController
        let drawerViewController = mainStoryBoard.instantiateViewController(withIdentifier: "DrawerController") as! DrawerController
        
        let drawerSideNav = UINavigationController(rootViewController: drawerViewController)
        let centerNav = UINavigationController(rootViewController: centerViewController)
        
        let screenWidth = UIScreen.main.bounds.width
        
        centerContainer = MMDrawerController(center: centerNav, leftDrawerViewController: drawerSideNav)
        
        centerContainer!.openDrawerGestureModeMask = MMOpenDrawerGestureMode.all
        centerContainer!.closeDrawerGestureModeMask = MMCloseDrawerGestureMode.all
        centerContainer!.maximumLeftDrawerWidth = screenWidth * 0.75
        
        return centerContainer! as MMDrawerController;
    }
    
    func pushViewController(viewController: UIViewController) {
        self.centerContainer?.setCenterView(viewController, withCloseAnimation: true, completion: nil)
    }
    
    func toggleDrawer() {
        self.centerContainer?.toggle(MMDrawerSide.left, animated: true, completion: nil)
    }
}
