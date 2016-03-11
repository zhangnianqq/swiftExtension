//
//  NSDateExtension.swift
//  类扩展
//
//  Created by zhangnian on 15/11/19.
//  Copyright © 2015年 zhangnian. All rights reserved.
//

import UIKit

extension NSDate{
    /*
    //当前时间加上1天
    let date : NSDate = NSDate().dateByAddingTimeInterval(60 * 60 * 24)
    */
    /**
    对象时间和输入时间的天数差
    用法：date.daysInBetweenDate(NSDate())
    - parameter date: 时间
    
    - returns: 天数
    */
    func daysInBetweenDate(date: NSDate) -> Int
    {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff/86400)
        // roundoff() 方法作用是  douuble类型 四舍五入转整形
        return diff.roundoff()
    }
    
    /**
     对象时间和输入时间的小时差
     用法：date.hoursInBetweenDate(NSDate())
     - parameter date: 时间
     
     - returns: 小时数
     */
    func hoursInBetweenDate(date: NSDate) -> Int
    {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff/3600)
        return diff.roundoff()
    }
    /**
     对象时间和输入时间的分钟差
     用法：date.minutesInBetweenDate(NSDate())
     - parameter date: 时间
     
     - returns: 分数
     */
    func minutesInBetweenDate(date: NSDate) -> Int
    {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff/60)
        return diff.roundoff()
    }
    /**
     对象时间和输入时间的秒差
     用法：date.secondsInBetweenDate(NSDate())
     - parameter date: 时间
     
     - returns: 分数
     */
    func secondsInBetweenDate(date: NSDate) -> Int
    {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff)
        return diff.roundoff()
    }
    
    /**
     //时间转时间戳 用法 NSDate().dataToDouble()
     
     - returns: 当前时区的时间戳
     */
    func dataToString()->String{
        return "\(Int(self.timeIntervalSince1970))"
    }
    func dataToDouble()->Double{
        return Double(self.timeIntervalSince1970)
    }
    
    /**
     //时间戳转为时间 用法 NSDate.dateWithTimeIntervalInMilliSecondSince1970(NSDate().dataToDouble())
     
     - parameter timeIntervalInMilliSecond:Double类型的时间戳
     
     - returns: 时间戳转为时间
     */
    class func dateWithTimeIntervalInMilliSecondSince1970( timeIntervalInMilliSecond:Double)->NSString{
        var timeInterval:Double  = timeIntervalInMilliSecond
        if timeIntervalInMilliSecond > 140000000000 {
            timeInterval = timeIntervalInMilliSecond/1000
        }
        //加8小时 为时区转换
        let ret:NSDate = NSDate(timeIntervalSince1970: timeInterval+8*60*60)
        let timeStr:String = "\(ret)" //长度25
        let timeS:NSString = (timeStr as NSString).substringToIndex(timeStr.length-5)
        return timeS
    }

    
    /*
    /*
    年的显示：
    yy：年的后面2位数字
    yyyy：显示完整的年
    月的显示：
    M：显示成1~12，1位数或2位数
    MM：显示成01~12，不足2位数会补0
    MMM：英文月份的缩写，例如：Jan
    MMMM：英文月份完整显示，例如：January
    
    日的显示：
    d：显示成1~31，1位数或2位数
    dd：显示成01~31，不足2位数会补0
    星期的显示：
    EEE：星期的英文缩写，如Sun
    EEEE：星期的英文完整显示，如，Sunday
    
    上/下午的显示：
    aa：显示AM或PM
    
    小時的显示：
    H：显示成0~23，1位数或2位数(24小时制
    HH：显示成00~23，不足2位数会补0(24小时制)
    K：显示成0~12，1位数或2位数(12小時制)
    KK：显示成0~12，不足2位数会补0(12小时制)
    
    分的显示：
    m：显示0~59，1位数或2位数
    mm：显示00~59，不足2位数会补0
    
    秒的显示：
    s：显示0~59，1位数或2位数
    ss：显示00~59，不足2位数会补0
    S： 毫秒的显示
    时区的显示：
    z / zz /zzz ：PDT
    zzzz：Pacific Daylight Time
    Z / ZZ / ZZZ ：-0800
    ZZZZ：GMT -08:00
    v：PT
    vvvv：Pacific Time
    */

    */
    /**
    获取当前时间 字符串 时间格式为 例：let dataString = NSDate().dataChangeString(),
    let dataString = NSDate().dataChangeString("yyyy:MM:dd HH:mm"),
    
    - parameter dateFormat: 时间格式 可不写
    
    - returns: 时间对象
    */
    func dataChangeString(dateFormat:String = "yyyy:MM:dd HH:mm") -> String {
        let dateFormatter:NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = dateFormat
        let destDateString = dateFormatter.stringFromDate(self)
        return destDateString;
    }
}
