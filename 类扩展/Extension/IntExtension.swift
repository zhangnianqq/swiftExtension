//
//  IntExtension.swift
//  类扩展
//
//  Created by zhangnian on 15/11/18.
//  Copyright © 2015年 zhangnian. All rights reserved.
//

import UIKit

extension Int{
    /// 是偶数
    var isEven:Bool     {return (self % 2 == 0)}
    /// 是奇数
    var isOdd:Bool      {return (self % 2 != 0)}
    /// 是整数
    var isPositive:Bool {return (self >= 0)}
    /// 是负数
    var isNegative:Bool {return (self < 0)}
    /// 转为double
    var toDouble:Double {return Double(self)}
    /// 转为float
    var toFloat:Float   {return Float(self)}
}
extension Double {
    //四舍五入 双精度小数转为整形
    func roundoff() -> Int
    {
        let a = Int(self)
        let b = Double(a)+0.5
        if(self > b)
        { return a+1 }
        else
        { return a }
    }
}
