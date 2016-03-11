//
//  UIButtonExtension.swift
//  类扩展
//
//  Created by zhangnian on 16/3/10.
//  Copyright © 2016年 zhangnian. All rights reserved.
//

import UIKit

extension UIButton {
    
    /**
     纯文字按钮
     
     - parameter frame: 范围
     - parameter title:  文字
     - parameter titeleColol: 文字颜色
     - parameter backgroundColor: 背景颜色
     - parameter target: 对象
     - parameter action: 触发事件
     
     - returns: 对象
     */
    class func createTitleButton(frame:CGRect,title:String?,titeleColol:UIColor?, backgroundColor:UIColor?, target:AnyObject?, action:Selector?)->UIButton {
        let button:UIButton = UIButton(type: UIButtonType.Custom)
        button.configButton(frame, title: title, titeleColol: titeleColol, imageName: nil, selectImageName: nil, bgImageName: nil, backgroundColor: backgroundColor, target: target, action: action)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 4
        return button
    }
    /**
     创建左图右文字的按钮
     
     - parameter frame:     范围
     - parameter imageName: 图片名称
     - parameter target:    对像
     - parameter action:    触发事件
     - parameter title:     文字
     
     - returns: 按钮对象
     */
    class func createButton(frame:CGRect, leftTitle:String?,rightImageName:String?, target:AnyObject, action:Selector )->UIButton {
        return self.createButton(frame,  title: leftTitle, imageName: rightImageName, selectImageName: nil, target: target, action: action, backgroundImageName: nil)
    }
    
    /**
     带选择图片的按钮
     
     - parameter frame: 范围
     - parameter imageName:  图片名
     - parameter selectImageName: 选择时图片名称
     - parameter target:  对象
     - parameter action: 触发事件
     - parameter title: 文字
     - parameter backgroundImageName: 背景图
     
     - returns: 对象
     */
    class func createButton(frame:CGRect,title:String?,imageName:String?, selectImageName:String?, target:AnyObject, action:Selector,  backgroundImageName:String?)->UIButton {
        let button:UIButton = UIButton(type: UIButtonType.Custom)
        button.configButton(frame, title: title, titeleColol: nil, imageName: imageName, selectImageName: selectImageName, bgImageName: backgroundImageName, backgroundColor: nil, target: target, action: action)
        return button
    }
    
    
    /**
     创建圆形图片按钮
     
     - parameter frame:  大小
     - parameter image:  图片
     - parameter target: 对象
     - parameter action: 触发事件
     
     - returns: 对象
     */
    class func createRoundImageButton(frame:CGRect, title:String?, titleColor:UIColor?, backgroundColor:UIColor?, bgImageName:String?,target:AnyObject?, action:Selector?) ->UIButton {
        let button:UIButton = UIButton(type: UIButtonType.Custom)
        if bgImageName != nil {
            button .setBackgroundImage(UIImage(named: bgImageName!), forState: UIControlState.Normal)
        }
        button.configButton(frame, title: title, titeleColol: titleColor, imageName: nil, selectImageName: nil, bgImageName: nil, backgroundColor: backgroundColor, target: target, action: action)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = frame.width/2
        return button
    }
    ///只有背景图的按钮
    class func createBgImageBtn(frame:CGRect ,bgImageName:String?,target:AnyObject?, action:Selector?)-> UIButton {
        let btn = UIButton(type: UIButtonType.Custom)
        if target != nil && action != nil {
            btn.addTarget(target!, action: action!, forControlEvents: UIControlEvents.TouchUpInside)
        }
        if bgImageName != nil {
            btn.setBackgroundImage(UIImage(named: bgImageName!), forState: UIControlState.Normal)
            btn.setBackgroundImage(UIImage(named: bgImageName!), forState: UIControlState.Selected)
        }
        return btn
    }
    
    /**
     配置按钮属性
     
     - parameter frame:           范围
     - parameter title:           文字
     - parameter titeleColol:     文字颜色
     - parameter imageName:       图片名称
     - parameter selectImageName: 选择的图片名称
     - parameter bgImageName:     背景图
     - parameter backgroundColor: 背景色
     - parameter target:          对象
     - parameter action:          触发事件
     */
    func configButton(frame:CGRect,title:String?,titeleColol:UIColor?,imageName:String?, selectImageName:String?,bgImageName:String?, backgroundColor:UIColor?, target:AnyObject?, action:Selector?) {
        self.frame = frame
        if title != nil {
            self.setTitle(title!, forState: UIControlState.Normal)
        }
        if titeleColol != nil {
            self.setTitleColor(titeleColol, forState: UIControlState.Normal)
        }
        if imageName != nil {
            self.setImage(UIImage(named: imageName!), forState: UIControlState.Normal)
        }
        if selectImageName != nil {
            self.setImage(UIImage(named: selectImageName!), forState: UIControlState.Selected)
        }
        if backgroundColor != nil {
            self.backgroundColor = backgroundColor
        }
        if bgImageName != nil {
            self.setBackgroundImage(UIImage(named: bgImageName!), forState: UIControlState.Normal)
            self.setBackgroundImage(UIImage(named: bgImageName!), forState: UIControlState.Selected)
        }
        if target != nil && action != nil {
            self.addTarget(target!, action: action!, forControlEvents: UIControlEvents.TouchUpInside)
        }
    }
}
