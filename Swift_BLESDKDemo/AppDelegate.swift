//
//  AppDelegate.swift
//  Swift_BLESDKDemo
//
//  Created by San on 19/6/2020.
//  Copyright © 2020 medica. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let window: UIWindow = UIWindow.init(frame: UIScreen.main.bounds)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window.rootViewController = UINavigationController(rootViewController: ConfigWiFiViewController())
        self.window.backgroundColor = .white;
        self.window.makeKeyAndVisible()
    
        return true
    }
    
    
    
    
}

