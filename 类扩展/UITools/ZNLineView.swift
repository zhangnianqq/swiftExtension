//
//  ZNLineView.swift
//  划线
//
//  Created by zhangnian on 15/10/28.
//  Copyright © 2015年 zhangnian. All rights reserved.
//
/*
用法
let line = ZNLineView(frame: CGRectMake( 10, 20, 100, 200))
line.color = UIColor.redColor()
line.lineType = ZNLineType.ShadowAndDottedLine
line.lineContentMode = ZNLineContentMode.Vertical
view.addSubview(line)
*/
import UIKit
 /**
  线条类型
 
 - None:                实线
 - DottedLine:          虚线
 - ShadowLine:          阴影
 - ShadowAndDottedLine: 虚线+阴影
 */
enum ZNLineType {
    case None
    case DottedLine
    case ShadowLine
    case ShadowAndDottedLine
}
//线条垂直方向
enum ZNLineContentMode {
    case None       //正常横向
    case Vertical   //竖直
}
class ZNLineView: UIView {
    var color : UIColor?                    // 线条填充色
    var lineType:ZNLineType?                // 线条类型
    var lineContentMode:ZNLineContentMode?  //线条垂直方向
    var lineWith = 0.6                      //线宽 默任为 0.6
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func drawRect(rect: CGRect) {
        //1.取得图形上下文对象
        let  context = UIGraphicsGetCurrentContext()
        
        //2.创建路径对象
        let path = CGPathCreateMutable();
        CGPathMoveToPoint(path, nil, 0, 0);//移动到指定位置（设置路径起点）
        if lineContentMode == ZNLineContentMode.Vertical {
           CGPathAddLineToPoint(path, nil, 0, rect.height);//绘制直线（从起始位置开始）
        }else{
              CGPathAddLineToPoint(path, nil, rect.width, 0);//绘制直线（从起始位置开始）
        }
        //     CGPathAddLineToPoint(path, nil, 300, 100);//绘制另外一条直线（从上一直线终点开始绘制）

        //3.添加路径到图形上下文
        CGContextAddPath(context, path);
        //
        //     //4.设置图形上下文状态属性
        //     CGContextSetRGBStrokeColor(context, 1.0, 0, 0, 1);//设置笔触颜色
        if color == nil {
            CGContextSetRGBFillColor(context, 0, 1.0, 0, 1);//设置填充色
        }else {
            CGContextSetStrokeColorWithColor(context, self.color!.CGColor)
        }

        CGContextSetLineWidth(context, CGFloat(self.lineWith));//设置线条宽度
        //     CGContextSetLineCap(context, kCGLineCapRound);//设置顶点样式,（20,50）和（300,100）是顶点
        //     CGContextSetLineJoin(context, kCGLineJoinRound);//设置连接点样式，(20,100)是连接点
         /*设置线段样式
         phase:虚线开始的位置
         lengths:虚线长度间隔（例如下面的定义说明第一条线段长度4，然后间隔2重新绘制8点的长度线段，当然这个数组可以定义更多元素）
         count:虚线数组元素个数
         */
        if self.lineType == ZNLineType.DottedLine || self.lineType == ZNLineType.ShadowAndDottedLine {
            let lengths:[CGFloat] = [8,4]
            CGContextSetLineDash(context, 0, lengths, 2)
        }
        /*设置阴影
         context:图形上下文
         offset:偏移量
         blur:模糊度
         color:阴影颜色
         */
        if self.lineType == ZNLineType.ShadowLine || lineType == ZNLineType.ShadowAndDottedLine {
            let shadowColor = UIColor.grayColor().CGColor //颜色转化，由于Quartz 2D跨平台，所以其中不能使用UIKit中的对象，但是UIkit提供了转化方法
            CGContextSetShadowWithColor(context, CGSizeMake(2, 2), 0.8, shadowColor);
        }
        //5.绘制图像到指定图形上下文
        /*CGPathDrawingMode是填充方式,枚举类型
         kCGPathFill:只有填充（非零缠绕数填充），不绘制边框
         kCGPathEOFill:奇偶规则填充（多条路径交叉时，奇数交叉填充，偶交叉不填充）
         kCGPathStroke:只有边框
         kCGPathFillStroke：既有边框又有填充
         kCGPathEOFillStroke：奇偶填充并绘制边框
         */
        CGContextDrawPath(context, CGPathDrawingMode.EOFillStroke);//最后一个参数是填充类型
        //6.释放对象
//        CGPathRelease(path);
    }

}
