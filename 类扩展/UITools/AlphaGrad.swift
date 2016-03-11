//
//  AlphaGrad.swift
//  颜色渐变
//
//  Created by zhangnian on 15/11/6.
//  Copyright © 2015年 zhangnian. All rights reserved.
//
/*
//用法  
let bgView = AlphaGrad(frame:UIScreen.mainScreen().bounds)
bgView.colors = [UIColor.greenColor(),UIColor.whiteColor()]
view.addSubview(bgView)
*/
import UIKit

class AlphaGrad: UIView {
    var colors:[UIColor]?
    override func drawRect(rect: CGRect) {
        let gradient1 = CAGradientLayer(layer: layer)
        gradient1.frame = rect
        var tempColors = [CGColor]()
        for  var i = 0 ; i < colors?.count ; i++ {
            tempColors.append(colors![i].CGColor)
        }
        gradient1.colors = tempColors
        self.layer.insertSublayer(gradient1, atIndex: 0)
    }
}
