//
//  AppDelegate.swift
//  WeiBo
//
//  Created by Miller on 15/9/26.
//  Copyright © 2015年 Xie Yufeng. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.backgroundColor = UIColor.redColor()
        
        window?.rootViewController = MainTabBarController()
        
        window?.makeKeyAndVisible()
        
        return true
    }

    


}

