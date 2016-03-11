//
//  NSObjectExtension.swift
//  类扩展
//
//  Created by zhangnian on 15/11/19.
//  Copyright © 2015年 zhangnian. All rights reserved.
//

import UIKit

/**
 Log 是非常消耗性能,并且用户根本看不到这个打印
 使用前提：
 在build settings 搜索 compiler  找到swift compiler - custom flags 下的 other swift flags
 上线前 去掉-D DEBUG
 测试时加上  -D DEBUG
 解决方法：
 
 项目分为开发阶段和发布阶段，开发阶段打印Log，发布阶段屏蔽Log
 格式: 方法名称[行号]: 内容
 print(_FILE_) // 拿到当前文件路径
 print(_LINE_) // 拿到当前的行号
 print(_FUNCTION_) // 拿到当前的方法名称
 
 - parameter message: 消息
 - parameter file:    拿到当前文件路径
 - parameter method:  拿到当前的方法名称
 - parameter line:    拿到当前的行号
 */
func ZNLog<T>(message:T, file: NSString = __FILE__, method: String = __FUNCTION__, line: Int = __LINE__) {
    
    #if DEBUG
        print("\(method)[\(line)]: \(message)")
    #endif
}

extension NSObject {
    /**
     延迟几秒时间再执行代码块 block形式的  用法2种：
     1、self.performClosureAfterDelay(5, block: {
     print("Log after 2.0 delay");
     })
     2、self.performClosureAfterDelay(5) { () -> Void in
     print("哈哈")
     }
     
     - parameter delay: 延迟时间 秒为单位
     - parameter block: block回调
     */
    func performClosureAfterDelay(delay: Int, block:() -> Void) {
        let delay64 = Int64(delay)
        let nano64 = Int64(NSEC_PER_SEC)
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay64 * nano64))
        
        dispatch_after(delayTime, dispatch_get_main_queue(), block)
    }
    
    //json字典 转 字符串  网络请求 输入参数时使用
    func toJSONString(dict:NSDictionary!)->NSString{
        do {
            let data = try NSJSONSerialization.dataWithJSONObject(dict, options: NSJSONWritingOptions.PrettyPrinted)
            let strJson = NSString(data: data, encoding: NSUTF8StringEncoding)
            return strJson!
        } catch {
            ZNLog(error)
            return ""
        }
    }
    /*
    /**
    * swift版打印所有的属性 没有这个方法 打印只能打印内存地址
    * 此方法需要结合MJExtension  使用
    */
    class MJExtensionSwiftModel: NSObject {
        override var description:String {
            return self.mj_keyValues().description;
        }
    }
    */
}
