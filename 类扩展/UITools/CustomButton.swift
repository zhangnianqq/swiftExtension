//
//  CustomButton.swift
//  XinBangEnterprise
//
//  Created by zhangnian on 15/12/8.
//  Copyright © 2015年 DDP. All rights reserved.
//自定义 图片在上 文字在下的button  文字下边还有一行说明文字 注意这个不能使用快速工厂方法创建

import UIKit

class CustomButton: ContentTopImageBottomText {
    lazy var desLabel:UILabel = {
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.width, height: 20))
        label.textColor = UIColor.whiteColor()
        label.font = UIFont.systemFontOfSize(13)
        label.textAlignment = NSTextAlignment.Center
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = true
        //取消选中时的高亮
        self.adjustsImageWhenHighlighted = false;
        self.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        addSubview(desLabel)
    }
    
    func configButton(title: String, imageName: String, backgroundColor: UIColor?,desText:String,target: AnyObject, action: Selector) {
        self.setImage(UIImage(named: imageName), forState: UIControlState.Normal)
        self.setTitle(title, forState: UIControlState.Normal)
        self.backgroundColor = backgroundColor
        self.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)

        self.desLabel.text = desText
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.titleLabel!.setTop(self.titleLabel!.top-10)
        self.imageView!.setTop(self.imageView!.top-10)
    //添加说明文字
        self.desLabel.frame = CGRectMake(0, self.titleLabel!.bottom, self.width, 20)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: 自定义button,文字在左边 图片在右边
class TextImageButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel?.font = UIFont.systemFontOfSize(16)
        titleLabel?.contentMode = UIViewContentMode.Center
        imageView?.contentMode = UIViewContentMode.Left
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel?.sizeToFit()
        titleLabel?.frame = CGRectMake(-5, 0, titleLabel!.width, height)
        imageView?.frame = CGRectMake(titleLabel!.width + 3 - 5, 0, width - titleLabel!.width - 3, height)
    }
}
/// MARK: - 自定义button  图片文字居中 图片在上文字在下
class ContentTopImageBottomText:UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //计算图片上边距离视图顶部的距离
        let addHeight = CGFloat(self.height - self.imageView!.height - self.titleLabel!.height)/CGFloat(2)
        // Center image
        var center = self.imageView!.center;
        center.x = self.frame.size.width/2;
        center.y = self.imageView!.frame.size.height/2+addHeight;
        self.imageView!.center = center;
        
        //Center text
        var newFrame = self.titleLabel!.frame;
        newFrame.origin.x = 0;
        newFrame.origin.y = self.imageView!.frame.size.height + addHeight+5;
        newFrame.size.width = self.frame.size.width;
        
        self.titleLabel!.frame = newFrame;
        self.titleLabel!.textAlignment = NSTextAlignment.Center;
    }
}