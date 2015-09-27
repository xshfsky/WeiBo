//
//  VisterView.swift
//  WeiBo
//
//  Created by Miller on 15/9/28.
//  Copyright © 2015年 Xie Yufeng. All rights reserved.
//

import UIKit

class VisterView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.whiteColor()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func registerBtnClick(button: UIButton) {
        YFLog(__FUNCTION__)
    }
    
    func loginBtnClick(button: UIButton) {
        YFLog(__FUNCTION__)
    }
    
    // MARK: - 懒加载控件
    private lazy var bgIcon: UIImageView = {
        let bgImageView = UIImageView(image: UIImage(named: ""))
        return bgImageView
    }()
    
    private lazy var faceIcon: UIImageView = {
        let faceImageView = UIImageView(image: UIImage(named: ""))
        return faceImageView
    }()
    
    private lazy var message: UILabel = {
        let messageLabel = UILabel()
        messageLabel.text = "附近的思考了几分离开的时间发来看电视剧罚款了但是但是"
        messageLabel.numberOfLines = 0
        messageLabel.textColor = UIColor.grayColor()
        return messageLabel
    }()
    
    private lazy var registerBtn: UIButton = {
        let btn = UIButton(type: UIButtonType.Custom)
        btn.setTitle("注册", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Highlighted)
        btn.setBackgroundImage(UIImage(named: ""), forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named: ""), forState: UIControlState.Highlighted)
        btn.addTarget(self, action: Selector("registerBtnClick:"), forControlEvents: UIControlEvents.TouchDown)
        return btn
    }()
    
    private lazy var loginBtn: UIButton = {
        let btn = UIButton(type: UIButtonType.Custom)
        btn.setTitle("注册", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Highlighted)
        btn.setBackgroundImage(UIImage(named: ""), forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named: ""), forState: UIControlState.Highlighted)
        btn.addTarget(self, action: Selector("loginBtnClick:"), forControlEvents: UIControlEvents.TouchDown)
        return btn
        }()
    
}
