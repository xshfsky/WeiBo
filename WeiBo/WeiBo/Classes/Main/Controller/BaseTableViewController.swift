//
//  BaseTableViewController.swift
//  WeiBo
//
//  Created by Miller on 15/9/28.
//  Copyright © 2015年 Xie Yufeng. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController , VisterViewDelegate {

    // 是否登录标记
    var isLogin: Bool = false
    var visiterView: VisterView?
    
    override func loadView() {
        // 根据是否登录动态加载主显示页面
        isLogin ? super.loadView() : loadVisiterView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func loadVisiterView() {
        // 1, 创建为登录应该显示界面
        visiterView = VisterView()
        visiterView!.delegate = self
        view = visiterView
        
        // 2, 设置导航左右两栏的显示
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
    }
    
    func visterViewDidRegisterButtonClick(visterView: VisterView) {
        YFLog("点击了")
    }
    
    func visterViewDidLoginButtonClick(visterView: VisterView) {
        YFLog("点击了")
    }

}
