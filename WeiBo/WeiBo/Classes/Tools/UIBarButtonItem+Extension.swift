//
//  Extension.swift
//  WeiBo
//
//  Created by Miller on 15/9/27.
//  Copyright © 2015年 Xie Yufeng. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    public convenience init(target: AnyObject?, action: Selector, imageNamed: String) {
        let clickBtn = UIButton(type: UIButtonType.Custom)
        clickBtn.setImage(UIImage(named: imageNamed), forState: UIControlState.Normal)
        clickBtn.setImage(UIImage(named: imageNamed + "_highlighted"), forState: UIControlState.Highlighted)
        clickBtn.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        clickBtn.sizeToFit()
        self.init(customView: clickBtn)
    }
}
