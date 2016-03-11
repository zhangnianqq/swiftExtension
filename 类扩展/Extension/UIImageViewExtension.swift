//
//  UIImageViewExtension.swift
//  类扩展
//
//  Created by zhangnian on 15/11/19.
//  Copyright © 2015年 zhangnian. All rights reserved.
//

import UIKit

// MARK: - UIImageView
extension UIImageView {
    /**
     开启了人机交互的图片
     
     - parameter frame: 区域
     - parameter imageName: 图片名
     - returns: 对象
     */
    class func createImageView(frame:CGRect, imageName:String?)->UIImageView {
        let imageView:UIImageView = UIImageView(frame: frame)
        if imageName != nil {
            imageView.image = UIImage(named: imageName!)
            imageView.contentMode = UIViewContentMode.Center
        }
        imageView.userInteractionEnabled = true
        return imageView
    }
    /**
     对sdwebimage 进一步封装
     
     - parameter url:                  图片请求网址
     - parameter placeholderImageName: 本地图片名称
     */
    /*结合SDWebimage 使用
    func zn_setImageWithURL(urlStr: String, placeholderImageName: String) {
        self.sd_setImageWithURL(NSURL(string: urlStr), placeholderImage: UIImage(named: placeholderImageName))
    }
    */
}


extension UIImage{
    //裁剪指定区域的图片
    func croppedImage(bound : CGRect) -> UIImage
    {
        let scaledBounds : CGRect = CGRectMake(bound.origin.x * self.scale, bound.origin.y * self.scale, bound.size.width * self.scale, bound.size.height * self.scale)
        let imageRef = CGImageCreateWithImageInRect(self.CGImage, scaledBounds)
        let croppedImage : UIImage = UIImage(CGImage: imageRef!, scale: self.scale, orientation: UIImageOrientation.Up)
        return croppedImage;
    }
    
    /// 按尺寸裁剪图片大小
    class func imageClipToNewImage(image: UIImage, newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(newSize)
        image.drawInRect(CGRect(origin: CGPointZero, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    /// 将传入的图片裁剪成带边缘的原型图片
    class func imageWithClipImage(image: UIImage, borderWidth: CGFloat, borderColor: UIColor) -> UIImage {
        let imageWH = image.size.width
        //        let border = borderWidth
        let ovalWH = imageWH + 2 * borderWidth
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(ovalWH, ovalWH), false, 0)
        let path = UIBezierPath(ovalInRect: CGRectMake(0, 0, ovalWH, ovalWH))
        borderColor.set()
        path.fill()
        
        let clipPath = UIBezierPath(ovalInRect: CGRectMake(borderWidth, borderWidth, imageWH, imageWH))
        clipPath.addClip()
        image.drawAtPoint(CGPointMake(borderWidth, borderWidth))
        
        let clipImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return clipImage
    }
    
    /// 将传入的图片裁剪成圆形图片
    func imageClipOvalImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, 0.0)
        let ctx = UIGraphicsGetCurrentContext()
        let rect = CGRectMake(0, 0, self.size.width, self.size.height)
        CGContextAddEllipseInRect(ctx, rect)
        
        CGContextClip(ctx)
        self.drawInRect(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    /**
     图片压缩 压缩系数小于0.3的话 模糊的有点明显 为0.3时 图片大小降低至原来的十分之一
     
     - parameter image: 要模糊的图片
     - parameter scaleFloat: 模糊系数
     
     - returns: 压缩后的图片
     */
    class func scaleImage(image:UIImage,scaleFloat:CGFloat) -> UIImage
    {
        let size = CGSizeMake(image.size.width * scaleFloat, image.size.height * scaleFloat);
        
        UIGraphicsBeginImageContext(size);
        let context = UIGraphicsGetCurrentContext()
        var transform = CGAffineTransformIdentity
        
        transform = CGAffineTransformScale(transform, scaleFloat, scaleFloat);
        CGContextConcatCTM(context, transform);
        
        // Draw the image into the transformed context and return the image
        image.drawAtPoint(CGPointMake(0.0, 0.0))
        let newimg = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newimg;
    }
}