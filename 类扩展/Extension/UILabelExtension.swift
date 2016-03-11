//
//  UILabelExtension.swift
//  类扩展
//
//  Created by zhangnian on 16/3/10.
//  Copyright © 2016年 zhangnian. All rights reserved.
//

import UIKit

extension UILabel {
    //快速创建
    class func createLabel(frame:CGRect, text:String, textColor:UIColor ,font:CGFloat?)->UILabel {
        let label: UILabel = UILabel(frame: frame)
        label.text = text;
        label.numberOfLines = 0;
        label.textColor = textColor;
        //行数字体 按照大小进行自适应
        label.adjustsFontSizeToFitWidth = true
        //对齐方式
        label.textAlignment = NSTextAlignment.Left
        //单词折行
        if font != nil {
            label.font = UIFont.systemFontOfSize(font!)
        }
        return label
    }
    
    /**
     一个label需要多个字体多个颜色时
     
     - parameter strArr:   字符串数组
     - parameter colorArr: 颜色数组
     - parameter fontArr:  字体大小数组
     */
    func numberStrColol(strArr:[String], colorArr:[UIColor],fontArr:[CGFloat]) {
        var overall = ""
        for var i = 0; i < strArr.count ; i++ {
            overall += strArr[i]
        }
        let str = NSMutableAttributedString(string: overall)
        //设置颜色 字体
        var loc = 0
        for var i = 0; i < strArr.count ; i++ {
            str.addAttribute(NSForegroundColorAttributeName, value: colorArr[i], range: NSRange.init(location: loc, length: strArr[i].length))
            str.addAttribute(NSFontAttributeName, value:UIFont.systemFontOfSize(fontArr[i]), range: NSRange.init(location:loc,length:strArr[i].length))
            loc = loc + strArr[i].length
        }
        self.attributedText = str
    }
}

extension UITextView {
    /**
     一个label需要多个字体多个颜色时
     
     - parameter strArr:   字符串数组
     - parameter colorArr: 颜色数组
     - parameter fontArr:  字体大小数组
     */
    func numberStrColol(strArr:[String], colorArr:[UIColor],fontArr:[CGFloat]) {
        var overall = ""
        for var i = 0; i < strArr.count ; i++ {
            overall += strArr[i]
        }
        let str = NSMutableAttributedString(string: overall)
        //设置颜色 字体
        var loc = 0
        for var i = 0; i < strArr.count ; i++ {
            str.addAttribute(NSForegroundColorAttributeName, value: colorArr[i], range: NSRange.init(location: loc, length: strArr[i].length))
            str.addAttribute(NSFontAttributeName, value:UIFont.systemFontOfSize(fontArr[i]), range: NSRange.init(location:loc,length:strArr[i].length))
            loc = loc + strArr[i].length
        }
        self.attributedText = str
    }
}
