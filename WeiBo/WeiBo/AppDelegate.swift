//
//  AppDelegate.swift
//  WeiBo
//
//  Created by Miller on 15/9/26.
//  Copyright © 2015年 Xie Yufeng. All rights reserved.
//

import UIKit

//@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // 修改TabBar的渲染色配置
        UITabBar.appearance().tintColor = UIColor.orangeColor()
        // 修改未登录时的导航栏左右文字的渲染色
        UINavigationBar.appearance().tintColor = UIColor.orangeColor()
        
        // 根据屏幕尺寸初始化UIWidow
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        // 设置Window的根控制器为MainTabBarController
        window?.rootViewController = MainTabBarController()
        
        // 使Window为KeyWindow并且显示
        window?.makeKeyAndVisible()
        
        return true
    }
}
/**
<32>[WeiBo.HomeTableViewController titleBtnClick:] message
*/
func YFLog<T>(message: T, fileName: NSString = __FILE__, lineNum: Int = __LINE__, funcName: String = __FUNCTION__) {
    #if DEBUG
    print("<\(lineNum)>[\(fileName.lastPathComponent) " + "\(funcName)]: \(message)")
    #endif
}

