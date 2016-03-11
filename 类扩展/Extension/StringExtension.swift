//
//  StringExtension.swift
//  类扩展
//
//  Created by zhangnian on 15/11/18.
//  Copyright © 2015年 zhangnian. All rights reserved.
//

import UIKit
import CoreLocation

extension String{
    /// 字符串长度
    var length:Int {return self.characters.count}
    /// string转为NSString
    var OCString: NSString {
        get {
            return self as NSString
        }
    }
    
    /// string转为Float
    var floatValue: Float? {return NSNumberFormatter().numberFromString(self)?.floatValue}
    /// string转为Double
    var doubleValue: Double? {return NSNumberFormatter().numberFromString(self)?.doubleValue}
    
    /**
     字符串截取 从第几位开始 长度为几位的字符串
     
     - parameter start:  开始位置
     - parameter length: 长度
     
     - returns: 字符串对象
     */
    func sub(start: Int, length: Int) -> String {
        assert(start >= 0)
        assert(length >= 0)
        assert(start <= self.characters.count - 1)
        assert(start + length <= self.characters.count)
        let a = (self as NSString).substringFromIndex(start)
        let b = (a as NSString).substringToIndex(length)
        return b
    }
    
    
    /**
     是否包含字符串 区分大小写
     
     - parameter s: 字符串
     
     - returns: 是否包含
     */
    func containsString(s:String) -> Bool
    {
        if(self.rangeOfString(s) != nil)
        {
            return true
        }
        else
        {
            return false
        }
    }
    /**
     是否包含字符串 根据后边的选项检索
     常用的选项
     NSStringCompareOptions.CaseInsensitiveSearch 不区分大小写
     NSStringCompareOptions.LiteralSearch 精确的逐字符等效
     NSStringCompareOptions.BackwardsSearch  从源代码字符串的结尾搜索
     
     - parameter s:             字符串
     - parameter compareOption: 这些选项适用于不同的搜索/查找和比较方法
     
     
     - returns: 是否包含
     */
    func containsString(s:String, compareOption: NSStringCompareOptions) -> Bool
    {
        if((self.rangeOfString(s, options: compareOption)) != nil)
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    /**
     反序排列
     
     - returns: 倒序的字符串
     */
    func reverse() -> String
    {
        var reverseString : String = ""
        for c in self.characters
        {
            reverseString = "\(c)" +  reverseString
        }
        return reverseString
    }
    
    /// 判断是否是邮箱
    func isValidateEmail() -> Bool {
        let emailRegex: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluateWithObject(self)
    }
    
    /// 判断是否是手机号
    func isValidateMobile() -> Bool {
        //固定电话
        let phoneRegex: String = "(?:(\\(\\+?86\\))(0[0-9]{2,3}\\-?)?([2-9][0-9]{6,7})+(\\-[0-9]{1,4})?)|"
            + "(?:(86-?)?(0[0-9]{2,3}\\-?)?([2-9][0-9]{6,7})+(\\-[0-9]{1,4})?)"
        //手机号码
        let fixed :String = "^((13[0-9])|(15[^4,\\D])|(18[0,0-9])|(17[0,0-9]))\\d{8}$"
        
        let phoneTest1 = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        let phoneTest2 = NSPredicate(format: "SELF MATCHES %@", fixed)
        
        if phoneTest1.evaluateWithObject(self) == true || phoneTest2.evaluateWithObject(self) == true{
            return true
        }else{
            return false
        }
    }
    
    
    //验证是否是 数字英文加下划线
    func isValidateEnglish() -> Bool {
        let deuRegex = "^[A-Za-z0-9]+$"
        let deuTest = NSPredicate(format: "SELF MATCHES %@", deuRegex)
        return deuTest.evaluateWithObject(self)
    }
    
    /// 判断是否是中文
    func isValidateChinese() -> Bool {
        let phoneRegex: String = "^[\\u4E00-\\u9FA5]*$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluateWithObject(self)
    }
    
    //验证单个字符 是否是数字
    func charIsNum() -> Bool {
        let deuRegex = "[0-9]"
        let deuTest = NSPredicate(format: "SELF MATCHES %@", deuRegex)
        return deuTest.evaluateWithObject(self)
    }
    
    //验证是否为小数
    func isDecimal() -> Bool {
        let deuRegex = "/^(\\-|\\+)?\\d*\\.\\d+|\\d+\\.\\d*|[1-9]\\d*$/"
        let deuTest = NSPredicate(format: "SELF MATCHES %@", deuRegex)
        return deuTest.evaluateWithObject(self)
    }
    
    /**
     全部为数字  不能包含小数点
     
     - returns: 是否全部为数字
     */
    func isAllDigit() -> Bool {
        for uni in unicodeScalars{
            if NSCharacterSet.decimalDigitCharacterSet().longCharacterIsMember(uni.value){
                continue
            }
            return false
        }
        return true
    }
    
    //判断是否为数字 或者小数
    func isNumber() -> Bool {
        if self.isAllDigit() == true || self.isDecimal() {
            return true
        }else{
            return false
        }
    }
    
    
    //字符串中数字转为*
    func stringIntoDigitalSignal() -> String {
        var newStr = ""
        for var i = 0 ; i < self.length; i++ {
            let s = (self as NSString).substringWithRange(NSMakeRange(i, 1))
            var newS = s
            if s.charIsNum() {
                newS = "*"
            }
            newStr += newS
        }
        return newStr
    }
    
    /**
     手机号中间隐藏 例18321317202变为183****7202 只显示前三位和后4位 中间用***代替
     - returns: 隐藏中间后的手机号
     */
    func phoneCenterHide() -> String {
        if self.length <= 3 {
            return self
        }
        let footerStr = (self as NSString).substringFromIndex(self.length-4)
        let headerStr = (self as NSString).substringToIndex(3)
        let phoneStr = "\(headerStr)****\(footerStr)"
        return phoneStr
    }

    
    /// 将字符串转换成经纬度
    func stringToCLLocationCoordinate2D(separator: String) -> CLLocationCoordinate2D? {
        let arr = self.componentsSeparatedByString(separator)
        if arr.count != 2 {
            return nil
        }
        
        let latitude: Double = NSString(string: arr[1]).doubleValue
        let longitude: Double = NSString(string: arr[0]).doubleValue
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    
    //小数位数过长 截取后两位
    func stringXiaoShuLiangWei() -> String {
        var str = ""
        if ((self as NSString).rangeOfString(".").location != NSNotFound) {
            let arr =  self.componentsSeparatedByString(".")
            let strLast = arr.last
            if (strLast!.length >= 3) {
                let str1 = (strLast! as NSString).substringToIndex(2)
                let num:Int = Int(str1)!+1
                str = "\(arr.first!).\(num)"
            }else{
                str = self
            }
        }else{
            str = self
        }
        return str
    }
    
    /**
     距离转换 <1千米 显示米 >1千米转为千米 小数位显示1位  整数的话 不显示小数位u
     
     - parameter distance: 距离
     
     - returns: 文字
     */
    static func distanceConversion(distance:Double) -> String {
        let s = String(format:"%0.0f",distance)
        var str = "\(s)米"
        if distance > 1000 {
            let dis = String(format:"%0.1f",distance/Double(1000))
            let di = String(format:"%0.0f",distance/Double(1000))
            if di.floatValue! - dis.floatValue! == 0 {
                str = "\(di)公里"
            }else{
                str = "\(dis)公里"
            }
        }
        return str
    }
    
    
// MARK: - 新增方法
    /*IP验证 MODIFIED BY HELENSONG*/
    func isValidateIP() -> Bool {
        //IP 0.0.0.0 255.255.255.255  以下两个正则表达式都可以
        let regex = "(\\d{1,2}|1\\d\\d|2[0-4]\\d|25[0-5])\\.(\\d{1,2}|1\\d\\d|2[0-4]\\d|25[0-5])\\.(\\d{1,2}|1\\d\\d|2[0-4]\\d|25[0-5])\\.(\\d{1,2}|1\\d\\d|2[0-4]\\d|25[0-5])"
        //    let regex = "((25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]\\d|\\d)\\.){3}(25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]\\d|[1-9])";
        let ipTest = NSPredicate(format: "SELF MATCHES %@", regex)
        return ipTest.evaluateWithObject(self)
    }

}

