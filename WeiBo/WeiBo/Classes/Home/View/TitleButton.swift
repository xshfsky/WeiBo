//
//  TitleButton.swift
//  WeiBo
//
//  Created by Miller on 15/9/27.
//  Copyright © 2015年 Xie Yufeng. All rights reserved.
//

import UIKit

class TitleButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.titleLabel?.frame.origin.x = 0
        self.imageView?.frame.origin.x = (self.titleLabel?.bounds.size.width)!
    }

}
