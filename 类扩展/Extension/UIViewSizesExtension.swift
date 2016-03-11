//
//  UIViewSizesExtension.swift
//  
//
//  Created by Alex Berger on 6/6/14.
//  Copyright (c) 2014 aberger.me. All rights reserved.
//

import UIKit

//屏幕宽高
let screen_Width = UIScreen.mainScreen().bounds.width
let screen_Height = UIScreen.mainScreen().bounds.height
let screen_Bounds: CGRect = UIScreen.mainScreen().bounds


extension UIView {
    //以6为基础 等比宽高
    func fixedHeight(height:CGFloat)->CGFloat{
        return  height/(667/UIScreen.mainScreen().bounds.height)
    }
    
    func fixedWidth(width:CGFloat) -> CGFloat {
        return width/(375/UIScreen.mainScreen().bounds.width)
    }
    
    ///获得左边的距离
    var left: CGFloat { return self.frame.origin.x }
    ///设置左边的距离 其他不变
    func setLeft(x: CGFloat) {
        var frame: CGRect = self.frame
        frame.origin.x = x
        self.frame = frame
    }
    ///获得顶部距离
    var top: CGFloat { return self.frame.origin.y }
    ///设置顶部距离 其他不变
    func setTop(y: CGFloat) {
        var frame: CGRect = self.frame
        frame.origin.y = y
        self.frame = frame
    }
    ///获得控件右边距离
    var right: CGFloat { return self.frame.origin.x + self.frame.size.width }
    ///设置右边距离 其他不变
    func setRight(right: CGFloat) {
        var frame: CGRect = self.frame
        frame.origin.x = right - frame.size.width
        self.frame = frame
    }
    ///获得下部距离
    var bottom: CGFloat { return self.frame.origin.y + self.frame.size.height }
    ///设置下部距离 其他不变
    func setBottom(bottom: CGFloat) {
        var frame: CGRect = self.frame
        frame.origin.y = bottom - frame.size.height
        self.frame = frame
    }
    ///获得视图的宽度
    var width: CGFloat { return self.frame.size.width }
    ///设置视图宽度 其他不变
    func setWidth(width: CGFloat) {
        var frame: CGRect = self.frame
        frame.size.width = width
        self.frame = frame
    }
    ///获得高度
    var height: CGFloat { return self.frame.size.height }
    ///设置高度 其他不变
    func setHeight(height: CGFloat) {
        var frame: CGRect = self.frame
        frame.size.height = height
        self.frame = frame
    }
    ///获得左边和上部距离
    var origin: CGPoint { return self.frame.origin }
    ///设置左边和上部距离 其他不变
    func setOrigin(origin: CGPoint) {
        var frame: CGRect = self.frame
        frame.origin = origin
        self.frame = frame
    }
    ///获得宽度和高度
    var size: CGSize { return self.frame.size }
    ///设置宽度和高度 其他不变
    func setSize(size: CGSize) {
        var frame: CGRect = self.frame
        frame.size = size
        self.frame = frame
    }
    /**
     只改变中心点得x值
     - parameter x: x值
     */
    func setCenterX(x:CGFloat)
    {
        self.center = CGPointMake(x, self.center.y)
    }
    /**
    只改变中心点的y值
    
    - parameter y: y值
    */
    func setCenterY(y:CGFloat)
    {
        self.center = CGPointMake(self.center.x, y)
    }
    
    //裁剪成圆形
    func round()
    {
        //height and width should be the same
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 2
    }
}

// MARK: - UIScrollView
extension UIScrollView{
    /**
     创建scrollView 自带翻页 隐藏滚动条
     
     - parameter frmae:       区域
     - parameter contentSize: 滚动大小
     
     - returns: 对象
     */
    class func makeScrollView(frmae:CGRect, contentSize:CGSize)->UIScrollView{
        let scrollView:UIScrollView = UIScrollView(frame: frmae)
        scrollView.contentSize = contentSize
        //翻页
        scrollView.pagingEnabled = true
        //隐藏滚动态条
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }
}
