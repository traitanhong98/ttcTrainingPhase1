//
//  AppDelegate.swift
//  IOSTrainingVer1
//
//  Created by Trung Nguyen on 7/11/20.
//  Copyright © 2020 Trung Nguyen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
         self.window = UIWindow(frame: UIScreen.main.bounds)
               let viewController = FirstVC()

               self.window?.rootViewController = viewController
               self.window?.makeKeyAndVisible()
        return true
    }
}

