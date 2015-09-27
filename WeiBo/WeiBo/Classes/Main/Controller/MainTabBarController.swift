//
//  MainTabBarController.swift
//  WeiBo
//
//  Created by Miller on 15/9/26.
//  Copyright © 2015年 Xie Yufeng. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    // MARK: - View 生命周期方法
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1, 添加TabBar子控制器
        addchildviewControllers()

    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBar.addSubview(centerBtn)
        
        let btnW = UIScreen.mainScreen().bounds.width / CGFloat(childViewControllers.count)
        let btnH = tabBar.bounds.height
        let rect = CGRect(origin: CGPointZero, size: CGSizeMake(btnW, btnH))
        centerBtn.frame = CGRectOffset(rect, btnW * 2, 0)
    }
    
    // MARK: - 控件绑定方法
    func centerBtnClick(centerBtn: UIButton) {
        YFLog(__FUNCTION__)
    }
    
    // MARK: - 私有方法
    private func addchildviewControllers() {
        
        do {
            let path = NSBundle.mainBundle().pathForResource("MainVCSetting.json", ofType: nil)!
            let data = NSData(contentsOfFile: path)!
            let dictArray = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)
            for dict in dictArray as! [[String: AnyObject]] {
                addChildViewController(dict["vcName"] as! String, imageNamed: dict["imageName"] as! String, title: dict["title"] as! String)
            }
        } catch {
            addChildViewController("HomeTableViewController", imageNamed: "tabbar_home", title: "首页")
            
            addChildViewController("MessageTableViewController", imageNamed: "tabbar_message_center", title: "消息")
            
            addChildViewController("NullViewController", imageNamed: "", title: "")
            
            addChildViewController("DiscoverTableViewController", imageNamed: "tabbar_discover", title: "广场")
            
            addChildViewController("ProfileTableViewController", imageNamed: "tabbar_profile", title: "我的")
        }
        
        
    }
    
    private func addChildViewController(vcNamed: String, imageNamed: String, title: String) {
        // 1, 通过info.plist配置文件获取命名空间
        let nsp = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
        // 2, 拼接类对象的字符串全名
        let vcNamedWithNsp = nsp + "." + vcNamed;
        
        // 3, 通过反射根据类对象的字符串名反射出类对象
        if let anyVC = NSClassFromString(vcNamedWithNsp) {
            // 3.1 初始化类的实例
            let vc = (anyVC as! UIViewController.Type).init()
            // 3.2 设置tabBar的各种属性
            if imageNamed != "" {
                vc.tabBarItem.image = UIImage(named: imageNamed)
                vc.tabBarItem.selectedImage = UIImage(named:imageNamed + "_highlighted")
            }
            vc.title = title
            // 3.3 初始化导航控制器并对子控制器包装
            let nav = UINavigationController()
            nav.addChildViewController(vc)
            addChildViewController(nav)
        }
        
    }
    
    // MARK: - 懒加载
    private lazy var centerBtn: UIButton = {
        let centerBtn = UIButton(type: UIButtonType.Custom)
        centerBtn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: UIControlState.Normal)
        centerBtn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Highlighted)
        centerBtn.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
        centerBtn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: UIControlState.Highlighted)
        centerBtn.addTarget(self, action: Selector("centerBtnClick:"), forControlEvents: UIControlEvents.TouchUpInside)
        return centerBtn
    }()
}
