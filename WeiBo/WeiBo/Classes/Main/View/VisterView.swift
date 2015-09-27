//
//  VisterView.swift
//  WeiBo
//
//  Created by Miller on 15/9/28.
//  Copyright © 2015年 Xie Yufeng. All rights reserved.
//

import UIKit
import SnapKit

@objc
protocol VisterViewDelegate: NSObjectProtocol {
    optional func visterViewDidRegisterButtonClick(visterView: VisterView)
    optional func visterViewDidLoginButtonClick(visterView: VisterView)
}
class VisterView: UIView {
    
    weak var delegate: VisterViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 232.0/255.0, green: 233.0/255.0, blue: 232.0/255.0, alpha: 1.0)
        
        loadUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func registerBtnClick(button: UIButton) {
        delegate?.visterViewDidRegisterButtonClick!(self)
    }
    
    func loginBtnClick(button: UIButton) {
        delegate?.visterViewDidLoginButtonClick!(self)
    }
    
    func setVisterViewInfo(isHome: Bool, imageNamed: String, title: String) {
    
        bgIcon.hidden = !isHome
        faceIcon.image = UIImage(named: imageNamed)
        message.text = title
        
        startAnimation()
    }
    
    func startAnimation() {
        let bgIconAnimate = CABasicAnimation(keyPath: "transform.rotation")
        bgIconAnimate.toValue = 2 * M_PI
        bgIconAnimate.duration = 20
        bgIconAnimate.repeatCount = MAXFLOAT
        bgIconAnimate.removedOnCompletion = false
        
        bgIcon.layer.addAnimation(bgIconAnimate, forKey: nil)
        
    }
    
    func loadUI() {
        // 1, 添加子控件
        addSubview(bgIcon)
        addSubview(faceIcon)
        addSubview(message)
        addSubview(registerBtn)
        addSubview(loginBtn)
//        addSubview(maskBgView)
        
        // 2, 布局约束
        bgIcon.snp_makeConstraints { (make) -> Void in
//            make.center.equalTo(self)
            make.centerX.equalTo(self)
            make.centerY.equalTo(self).multipliedBy(0.8)
        }
        faceIcon.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(bgIcon)
        }
        message.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(224)
            make.top.equalTo(bgIcon.snp_bottom)
            make.centerX.equalTo(bgIcon)
        }
        registerBtn.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(message.snp_bottom).offset(20)
            make.left.equalTo(message.snp_left)
            make.width.equalTo(100)
            make.height.equalTo(35)
        }
        loginBtn.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(registerBtn)
            make.right.equalTo(message.snp_right)
            make.size.equalTo(CGSize(width: 100, height: 35))
        }
//        maskBgView.snp_makeConstraints { (make) -> Void in
//            make.edges.equalTo(bgIcon).offset(0)
//        }
    
    }
    
    // MARK: - 懒加载控件
    private lazy var bgIcon: UIImageView = {
        let bgImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
        return bgImageView
    }()
    
    private lazy var faceIcon: UIImageView = {
        let faceImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
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
        btn.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Highlighted)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
//        btn.setBackgroundImage(UIImage(named: ""), forState: UIControlState.Highlighted)
        
        btn.addTarget(self, action: Selector("registerBtnClick:"), forControlEvents: UIControlEvents.TouchUpInside)
        return btn
    }()
    
    private lazy var loginBtn: UIButton = {
        let btn = UIButton(type: UIButtonType.Custom)
        btn.setTitle("登录", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Highlighted)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
//        btn.setBackgroundImage(UIImage(named: ""), forState: UIControlState.Highlighted)
        
        btn.addTarget(self, action: Selector("loginBtnClick:"), forControlEvents: UIControlEvents.TouchUpInside)
        return btn
        }()
    
    private lazy var maskBgView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
        return imageView
    }()
    
}
