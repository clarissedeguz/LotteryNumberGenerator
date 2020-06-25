//
//  AppDelegate.swift
//  Lottery649
//
//  Created by Claire De Guzman on 2020-05-25.
//  Copyright © 2020 Claire De Guzman. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // (1)
        window = UIWindow(frame: UIScreen.main.bounds)
        // (2)
        let viewController = TitleViewController()
        window?.rootViewController = viewController
        // (3)
        window?.makeKeyAndVisible()
        return true
    }

  
}

