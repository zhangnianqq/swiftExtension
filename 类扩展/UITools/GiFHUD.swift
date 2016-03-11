//
//  GiFHUD.swift
//  GiFHUD-Swift
//
//  Created by Cem Olcay on 07/11/14.
//  Copyright (c) 2014 Cem Olcay. All rights reserved.
/*用法  加载动画
GiFHUD.showWithOverlay() //显示带底部阴影的gif
GiFHUD.dismiss()  取消gif
*/

import UIKit

class GiFHUD: UIView {
    //hud的背景View
    private lazy var bgView:UIView = {
        let tmpView = UIView.init(frame: CGRectMake(0, 0, 100, 100))
        tmpView.backgroundColor = UIColor.clearColor()
        return tmpView
    }()
    //图片
    lazy var imageView:UIImageView = {
        let imageV = UIImageView(frame: CGRectMake(0, 0, 100, 100))
        imageV.image = UIImage(named: "logo80")
        imageV.contentMode = UIViewContentMode.Center
        return imageV
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(white: 0, alpha: 0.5)
        bgView.addSubview(imageView)
        addSubview(bgView)
        xuanZhuan(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /**
     显示控件
     */
    class func showWithOverlay(vc:UIViewController) {
        //        let window: UIWindow = UIApplication.sharedApplication().keyWindow!
        let hud = GiFHUD()
        //        window.addSubview(hud)
        //        window.bringSubviewToFront(hud)
        
        //        hud.center = CGPointMake(vc.view.frame.origin.x, vc.view.frame.origin.y-20)
        if vc.navigationController?.navigationBar.hidden == true {
            hud.frame = vc.view.frame
            hud.bgView.center = CGPointMake(hud.center.x, hud.center.y)
        }else{
            hud.frame = vc.view.frame
            hud.setTop(0)
            hud.bgView.center = CGPointMake(hud.center.x, hud.center.y-64)
        }
        vc.view.addSubview(hud)
    }
    
    class func dismiss(vc:UIViewController) {
        //        let window: UIWindow = UIApplication.sharedApplication().keyWindow!
        //         let hud = GiFHUD()
        for vie in  vc.view.subviews {
            if vie.isKindOfClass(GiFHUD) {
                vie.removeFromSuperview()
                return
            }
        }
    }
    // MARK: - 永久旋转360度
    /*旋转360度*/
    func xuanZhuan(view:UIView) {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        
        // 设定动画选项
        animation.duration = 1; // 持续时间
        animation.repeatCount = MAXFLOAT; // 重复次数
        
        // 设定旋转角度
        
        animation.fromValue = NSNumber(float: 0.0) // 起始角度
        NSLog("\(Float(2) * Float(M_PI))")
        animation.toValue = NSNumber(float:Float(2) * Float(M_PI)) // 终止角度
        
        // 添加动画
        view.layer.addAnimation(animation, forKey: "rotate-layer")
    }
}
