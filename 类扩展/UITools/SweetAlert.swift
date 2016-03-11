//
//  SweetAlert.swift
//  SweetAlert
//
//  Created by Codester on 11/3/14.
//  Copyright (c) 2014 Codester. All rights reserved.
//
/*
用法:
//只有一句提示的提示框
SweetAlert(self).showAlert(nil,title:"Here's a message!")

//有2句消息的提示
SweetAlert(self).showAlert(nil,title:"Here's a message!", subTitle: "It's pretty, isn't it?", style: AlertStyle.None)

//带成功动画的提示
SweetAlert(self).showAlert(nil,title:"Good job!", subTitle: "You clicked the button!", style: AlertStyle.Success)

警告动画的提示
SweetAlert(self).showAlert(nil,title:"Are you sure?", subTitle: "You file will permanently delete!", style: AlertStyle.Warning, buttonTitle:"Cancel", buttonColor:UIColor.colorWithHex(0xD0D0D0) , otherButtonTitle:  "Yes, delete it!", otherButtonColor: UIColor.colorWithHex(0xDD6B55)) { (isOtherButton) -> Void in
if isOtherButton == true {

}else {
成功提示
SweetAlert(self).showAlert(nil,title:"Deleted!", subTitle: "Your imaginary file has been deleted!", style: AlertStyle.Success)
}
}


//带触发的提示
SweetAlert(self).showAlert(nil,title:"Are you sure?", subTitle: "You file will permanently delete!", style: AlertStyle.Warning, buttonTitle:"No, cancel plx!", buttonColor:UIColor.colorWithHex(0xD0D0D0) , otherButtonTitle:  "Yes, delete it!", otherButtonColor: UIColor.colorWithHex(0xDD6B55)) { (isOtherButton) -> Void in
if isOtherButton == true {
//错误提示
SweetAlert(self).showAlert(nil,title:"Cancelled!", subTitle: "Your imaginary file is safe", style: AlertStyle.Error)
}
else {
//成功提示
SweetAlert(self).showAlert(nil,title:"Deleted!", subTitle: "Your imaginary file has been deleted!", style: AlertStyle.Success)
}
}

//带触发事件的错误提示
SweetAlert(self).showAlert(nil,title:"Are you sure?", subTitle: "You file will permanently delete!", style: AlertStyle.Error, buttonTitle:"OK", buttonColor:UIColor.colorWithHex(0xAEDEF4) , otherButtonTitle:  nil, otherButtonColor: nil) { (isOtherButton) -> Void in
SweetAlert(self).showAlert("Cancelled!", subTitle: "Your imaginary file is safe", style: AlertStyle.Error)
}

带图片的提示框
SweetAlert(self).showAlert(nil,title:"Sweet!", subTitle: "Here's a custom image.", style: AlertStyle.CustomImag(imageFile: "thumb.jpg"))

*/

import Foundation
import UIKit
import QuartzCore

public enum AlertStyle {
    case Success,Error,Warning,None
    case CustomImag(imageFile:String)
}

public class SweetAlert: UIViewController {
    let kBakcgroundTansperancy: CGFloat = 0.7
    let kHeightMargin: CGFloat = 10.0
    let KTopMargin: CGFloat = 20.0
    let kWidthMargin: CGFloat = 10.0
    let kAnimatedViewHeight: CGFloat = 70.0
    let kMaxHeight: CGFloat = 300.0
    var kContentWidth: CGFloat = 300.0
    let kButtonHeight: CGFloat = 35.0
    var textViewHeight: CGFloat = 90.0
    let kTitleHeight:CGFloat = 30.0
    var strongSelf:SweetAlert?
    var contentView = UIView()
    var titleLabel: UILabel = UILabel()
    var buttons: [UIButton] = []
    var animatedView: AnimatableView?
    var imageView:UIImageView?
    var subTitleTextView = UITextView()
    var subTextView = UITextView()
    var isExitsTextView:Bool = false
    var userAction:((isOtherButton: Bool) -> Void)? = nil
    var userActionAddText:((isOtherButton: Bool,text:String) -> Void)? = nil
    let kFont = "Helvetica"
    
    //删除图片按钮
    var xButton:UIButton = UIButton(type: UIButtonType.Custom)
    var isXButtonHidden:Bool = false
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.view.frame = UIScreen.mainScreen().bounds
        self.view.autoresizingMask = [UIViewAutoresizing.FlexibleHeight, UIViewAutoresizing.FlexibleWidth]
        self.view.backgroundColor = UIColor(red:0, green:0, blue:0, alpha:kBakcgroundTansperancy)
        self.view.addSubview(contentView)
        
        //Retaining itself strongly so can exist without strong refrence
        strongSelf = self
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupContentView() {
        contentView.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        contentView.layer.cornerRadius = 5.0
        contentView.layer.masksToBounds = true
        contentView.layer.borderWidth = 0.5
        contentView.addSubview(titleLabel)
        contentView.addSubview(subTitleTextView)
        contentView.backgroundColor = UIColor.colorWithHex(0xFFFFFF)
        contentView.layer.borderColor = UIColor.colorWithHex(0xCCCCCC).CGColor
        view.addSubview(contentView)
    }
    
    private func setupTitleLabel() {
        titleLabel.text = ""
        titleLabel.numberOfLines = 1
        titleLabel.textAlignment = .Center
        titleLabel.font = UIFont(name: kFont, size:25)
        titleLabel.textColor = UIColor.colorWithHex(0x575757)
    }
    
    private func setupTextView() {
        subTextView.text = ""
        subTextView.font = UIFont(name: kFont, size:16)
        subTextView.textColor = UIColor.colorWithHex(0x797979)
        subTextView.layer.masksToBounds = true
        subTextView.layer.cornerRadius = 5
        subTextView.layer.borderWidth = 0.6
        subTextView.layer.borderColor = UIColor.lightGrayColor().CGColor
        
    }
    
    private func setupSubtitleTextView() {
        subTitleTextView.text = ""
        subTitleTextView.textAlignment = .Center
        subTitleTextView.font = UIFont(name: kFont, size:16)
        subTitleTextView.textColor = UIColor.colorWithHex(0x797979)
        subTitleTextView.editable = false
    }
    
    private func setCancelBtn() {
        xButton.setImage(UIImage(named: "btn_close_normal.png"), forState: UIControlState.Normal)
        xButton.setImage(UIImage(named: "btn_close_selected.png"), forState: UIControlState.Highlighted)
        xButton.addTarget(self, action: "dismissAlert", forControlEvents: UIControlEvents.TouchUpInside)
        isXButtonHidden = true
        contentView.addSubview(xButton)
    }
    //是否存在可输入的textView
    private func resizeAndRelayout() {
        let mainScreenBounds = UIScreen.mainScreen().bounds
        self.view.frame.size = mainScreenBounds.size
        let x: CGFloat = kWidthMargin
        var y: CGFloat = KTopMargin
        let width: CGFloat = kContentWidth - (kWidthMargin*2)
        
        if isXButtonHidden == true {
            xButton.frame = CGRectMake(width-12, 0, 32, 32)
            contentView.addSubview(xButton)
            isXButtonHidden = false
        }
        
        if animatedView != nil {
            animatedView!.frame = CGRect(x: (kContentWidth - kAnimatedViewHeight) / 2.0, y: y, width: kAnimatedViewHeight, height: kAnimatedViewHeight)
            contentView.addSubview(animatedView!)
            y += kAnimatedViewHeight + kHeightMargin
        }
        
        if imageView != nil {
            imageView!.frame = CGRect(x: (kContentWidth - kAnimatedViewHeight) / 2.0, y: y, width: kAnimatedViewHeight, height: kAnimatedViewHeight)
            contentView.addSubview(imageView!)
            y += imageView!.frame.size.height + kHeightMargin
        }
        
        // Title
        if self.titleLabel.text != nil {
            titleLabel.frame = CGRect(x: x, y: y, width: width, height: kTitleHeight)
            contentView.addSubview(titleLabel)
            y += kTitleHeight + kHeightMargin
        }
        
        // Subtitle
        if self.subTitleTextView.text.isEmpty == false {
            let subtitleString = subTitleTextView.text! as NSString
            let rect = subtitleString.boundingRectWithSize(CGSize(width: width, height: 0.0), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName:subTitleTextView.font!], context: nil)
            textViewHeight = ceil(rect.size.height) + 10.0
            subTitleTextView.frame = CGRect(x: x, y: y, width: width, height: textViewHeight)
            contentView.addSubview(subTitleTextView)
            y += textViewHeight + kHeightMargin
        }
        
        if isExitsTextView == true {
            subTextView.frame = CGRect(x: x, y: y, width: width, height: 80)
            contentView.addSubview(subTextView)
            y += 80 + kHeightMargin
        }
        
        var buttonRect:[CGRect] = []
        for button in buttons {
            let string = button.titleForState(UIControlState.Normal)! as NSString
            buttonRect.append(string.boundingRectWithSize(CGSize(width: width, height:0.0), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes:[NSFontAttributeName:button.titleLabel!.font], context:nil))
        }
        
        var totalWidth: CGFloat = 0.0
        if buttons.count == 2 {
            totalWidth = buttonRect[0].size.width + buttonRect[1].size.width + kWidthMargin + 40.0
        }
        else{
            totalWidth = buttonRect[0].size.width + 20.0
        }
        y += kHeightMargin
        var buttonX = (kContentWidth - totalWidth ) / 2.0
        for var i = 0; i <  buttons.count; i++ {
            
            buttons[i].frame = CGRect(x: buttonX, y: y, width: buttonRect[i].size.width + 20.0, height: buttonRect[i].size.height + 10.0)
            buttonX = buttons[i].frame.origin.x + kWidthMargin + buttonRect[i].size.width + 20.0
            buttons[i].layer.cornerRadius = 5.0
            self.contentView.addSubview(buttons[i])
            buttons[i].addTarget(self, action: "pressed:", forControlEvents: UIControlEvents.TouchUpInside)
            
        }
        y += kHeightMargin + buttonRect[0].size.height + 10.0
        if y > kMaxHeight {
            let diff = y - kMaxHeight
            let sFrame = subTitleTextView.frame
            subTitleTextView.frame = CGRect(x: sFrame.origin.x, y: sFrame.origin.y, width: sFrame.width, height: sFrame.height - diff)
            
            for button in buttons {
                let bFrame = button.frame
                button.frame = CGRect(x: bFrame.origin.x, y: bFrame.origin.y - diff, width: bFrame.width, height: bFrame.height)
            }
            
            y = kMaxHeight
        }
        var contentViewY:CGFloat = (mainScreenBounds.size.height - y) / 2.0
        if isExitsTextView == true {
            contentViewY = (mainScreenBounds.size.height - y) / 2.0 - 110
        }
        contentView.frame = CGRect(x: (mainScreenBounds.size.width - kContentWidth) / 2.0, y: contentViewY, width: kContentWidth, height: y)
        contentView.clipsToBounds = true
    }
    
    public func pressed(sender: UIButton!) {
        if isExitsTextView == true {
            contentView.endEditing(true)
            self.closeAlert(sender.tag,subTextViewText: subTextView.text)
        }else{
            self.closeAlert(sender.tag)
        }
    }
    
    public override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        var sz = UIScreen.mainScreen().bounds.size
        let sver = UIDevice.currentDevice().systemVersion as NSString
        let ver = sver.floatValue
        if ver < 8.0 {
            // iOS versions before 7.0 did not switch the width and height on device roration
            if UIInterfaceOrientationIsLandscape(UIApplication.sharedApplication().statusBarOrientation) {
                let ssz = sz
                sz = CGSize(width:ssz.height, height:ssz.width)
            }
        }
        self.resizeAndRelayout()
    }
    
    func dismissAlert() {
        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.view.alpha = 0.0
            }) { (Bool) -> Void in
                self.view.removeFromSuperview()
                self.cleanUpAlert()
                
                //Releasing strong refrence of itself.
                self.strongSelf = nil
        }
    }
    
    func closeAlert(buttonIndex:Int){
        if userAction !=  nil {
            let isOtherButton = buttonIndex == 0 ? true: false
            SweetAlertContext.shouldNotAnimate = true
            userAction!(isOtherButton: isOtherButton)
            SweetAlertContext.shouldNotAnimate = false
        }
        
        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.view.alpha = 0.0
            }) { (Bool) -> Void in
                self.view.removeFromSuperview()
                self.cleanUpAlert()
                
                //Releasing strong refrence of itself.
                self.strongSelf = nil
        }
    }
    
    func closeAlert(buttonIndex:Int,subTextViewText:String){
        if userActionAddText !=  nil {
            let isOtherButton = buttonIndex == 0 ? true: false
            SweetAlertContext.shouldNotAnimate = true
            userActionAddText!(isOtherButton: isOtherButton,text:subTextViewText)
            SweetAlertContext.shouldNotAnimate = false
        }
        
        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.view.alpha = 0.0
            }) { (Bool) -> Void in
                self.view.removeFromSuperview()
                self.cleanUpAlert()
                
                //Releasing strong refrence of itself.
                self.strongSelf = nil
        }
    }
    
    func cleanUpAlert() {
        
        if self.animatedView != nil {
            self.animatedView!.removeFromSuperview()
            self.animatedView = nil
        }
        self.contentView.removeFromSuperview()
        self.contentView = UIView()
    }
    
    public func showAlert(vc:UIViewController?, title: String) -> SweetAlert {
        self.showAlert(vc, title:title, subTitle: nil, style: .None)
        return self
    }
    
    public func showAlert(vc:UIViewController?, title: String, subTitle: String?, style: AlertStyle) -> SweetAlert {
        self.showAlert(vc,title:title, subTitle: subTitle, style: style, buttonTitle: "OK")
        return self
        
    }
    
    public func showAlert(vc:UIViewController?,title: String, subTitle: String?, style: AlertStyle,buttonTitle: String, action: ((isOtherButton: Bool) -> Void)? = nil) -> SweetAlert {
        self.showAlert(vc, title:title, subTitle: subTitle, style: style, buttonTitle: buttonTitle,buttonColor: UIColor.redColor())
        userAction = action
        return self
    }
    
    public func showAlert(vc:UIViewController?,title: String, subTitle: String?, style: AlertStyle,buttonTitle: String,buttonColor: UIColor,action: ((isOtherButton: Bool) -> Void)? = nil) -> SweetAlert {
        self.showAlert(vc,title:title, subTitle: subTitle, style: style, buttonTitle: buttonTitle,buttonColor: buttonColor,otherButtonTitle:
            nil)
        userAction = action
        return self
    }
    
    public func showAlert(vc:UIViewController?,title: String, subTitle: String?, style: AlertStyle,buttonTitle: String,buttonColor: UIColor,otherButtonTitle:
        String?, action: ((isOtherButton: Bool) -> Void)? = nil) -> SweetAlert {
            self.showAlert(vc,title:title, subTitle: subTitle, style: style, buttonTitle: buttonTitle,buttonColor: buttonColor,otherButtonTitle:
                otherButtonTitle,otherButtonColor: UIColor.redColor())
            userAction = action
            return self
    }
    
    public func showAlert(vc:UIViewController?, title: String, subTitle: String?, style: AlertStyle,buttonTitle: String,buttonColor: UIColor,otherButtonTitle:
        String?, otherButtonColor: UIColor?,action: ((isOtherButton: Bool) -> Void)? = nil) {
            userAction = action
            if vc == nil {
                let window: UIWindow = UIApplication.sharedApplication().keyWindow!
                window.addSubview(view)
                window.bringSubviewToFront(view)
                view.frame = window.bounds
            }else{
                if vc!.navigationController?.navigationBar.hidden == true {
                    vc!.view.addSubview(view)
                    vc!.view.bringSubviewToFront(view)
                    view.frame = vc!.view.frame
                }else{
                    vc!.view.addSubview(view)
                    vc!.view.bringSubviewToFront(view)
                    view.frame = vc!.view.frame
                    view.setTop(0)
                }
            }
            self.setupContentView()
            self.setupTitleLabel()
            self.setupSubtitleTextView()
            isExitsTextView = false
            if buttonTitle == "取消并重新发布" {
                self.setCancelBtn()
            }
            
            switch style {
            case .Success:
                self.animatedView = SuccessAnimatedView()
                
            case .Error:
                self.animatedView = CancelAnimatedView()
                
            case .Warning:
                self.animatedView = InfoAnimatedView()
                
            case let .CustomImag(imageFile):
                if let image = UIImage(named: imageFile) {
                    self.imageView = UIImageView(image: image)
                }
            case .None:
                self.animatedView = nil
            }
            
            self.titleLabel.text = title
            if subTitle != nil {
                self.subTitleTextView.text = subTitle
            }
            buttons = []
            if buttonTitle.isEmpty == false {
                let button: UIButton = UIButton(type: UIButtonType.Custom)
                button.setTitle(buttonTitle, forState: UIControlState.Normal)
                button.backgroundColor = buttonColor
                button.userInteractionEnabled = true
                button.tag = 0
                buttons.append(button)
            }
            
            if otherButtonTitle != nil && otherButtonTitle!.isEmpty == false {
                let button: UIButton = UIButton(type: UIButtonType.Custom)
                button.setTitle(otherButtonTitle, forState: UIControlState.Normal)
                button.backgroundColor = otherButtonColor
                button.addTarget(self, action: "pressed:", forControlEvents: UIControlEvents.TouchUpInside)
                button.tag = 1
                buttons.append(button)
            }
            
            resizeAndRelayout()
            if SweetAlertContext.shouldNotAnimate == true {
                //Do not animate Alert
                if self.animatedView != nil {
                    self.animatedView!.animate()
                }
            }
            else {
                animateAlert()
            }
    }
    
    func animateAlert() {
        
        view.alpha = 0;
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.view.alpha = 1.0;
        })
        
        let previousTransform = self.contentView.transform
        self.contentView.layer.transform = CATransform3DMakeScale(0.9, 0.9, 0.0);
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.contentView.layer.transform = CATransform3DMakeScale(1.1, 1.1, 0.0);
            }) { (Bool) -> Void in
                UIView.animateWithDuration(0.1, animations: { () -> Void in
                    self.contentView.layer.transform = CATransform3DMakeScale(0.9, 0.9, 0.0);
                    }) { (Bool) -> Void in
                        UIView.animateWithDuration(0.1, animations: { () -> Void in
                            self.contentView.layer.transform = CATransform3DMakeScale(1.0, 1.0, 0.0);
                            if self.animatedView != nil {
                                self.animatedView!.animate()
                            }
                            
                            }) { (Bool) -> Void in
                                
                                self.contentView.transform = previousTransform
                        }
                }
        }
    }
    
    private struct SweetAlertContext {
        static var shouldNotAnimate = false
    }
    
    public func showAlertAddTextField(title: String, subTitle: String?, style: AlertStyle,buttonTitle: String,buttonColor: UIColor,otherButtonTitle:
        String?, otherButtonColor: UIColor?, textViewPlaceholder:String,action: ((isOtherButton: Bool,text:String) -> Void)? = nil) {
            userActionAddText = action
            let window: UIWindow = UIApplication.sharedApplication().keyWindow!
            window.addSubview(view)
            window.bringSubviewToFront(view)
            view.frame = window.bounds
            self.setupContentView()
            self.setupTitleLabel()
            self.setupSubtitleTextView()
            self.setupTextView()
            isExitsTextView = true
            switch style {
            case .Success:
                self.animatedView = SuccessAnimatedView()
                
            case .Error:
                self.animatedView = CancelAnimatedView()
                
            case .Warning:
                self.animatedView = InfoAnimatedView()
                
            case let .CustomImag(imageFile):
                if let image = UIImage(named: imageFile) {
                    self.imageView = UIImageView(image: image)
                }
            case .None:
                self.animatedView = nil
            }
            
            self.titleLabel.text = title
            if subTitle != nil {
                self.subTitleTextView.text = subTitle
            }
            buttons = []
            if buttonTitle.isEmpty == false {
                let button: UIButton = UIButton(type: UIButtonType.Custom)
                button.setTitle(buttonTitle, forState: UIControlState.Normal)
                button.backgroundColor = buttonColor
                button.userInteractionEnabled = true
                button.tag = 0
                buttons.append(button)
            }
            
            if otherButtonTitle != nil && otherButtonTitle!.isEmpty == false {
                let button: UIButton = UIButton(type: UIButtonType.Custom)
                button.setTitle(otherButtonTitle, forState: UIControlState.Normal)
                button.backgroundColor = otherButtonColor
                button.addTarget(self, action: "pressed:", forControlEvents: UIControlEvents.TouchUpInside)
                button.tag = 1
                buttons.append(button)
            }
            
            resizeAndRelayout()
            if SweetAlertContext.shouldNotAnimate == true {
                //Do not animate Alert
                if self.animatedView != nil {
                    self.animatedView!.animate()
                }
            }
            else {
                animateAlert()
            }
    }
    
}

// MARK: -

// MARK: Animatable Views

class AnimatableView: UIView {
    func animate(){
        print("Should overide by subclasss", terminator: "")
    }
}

class CancelAnimatedView: AnimatableView {
    
    var circleLayer = CAShapeLayer()
    var crossPathLayer = CAShapeLayer()
    
    override required init(frame: CGRect) {
        super.init(frame: frame)
        setupLayers()
        var t = CATransform3DIdentity;
        t.m34 = 1.0 / -500.0;
        t = CATransform3DRotate(t, CGFloat(90.0 * M_PI / 180.0), 1, 0, 0);
        circleLayer.transform = t
        crossPathLayer.opacity = 0.0
    }
    
    override func layoutSubviews() {
        setupLayers()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var outlineCircle: CGPath  {
        let path = UIBezierPath()
        let startAngle: CGFloat = CGFloat((0) / 180.0 * M_PI)  //0
        let endAngle: CGFloat = CGFloat((360) / 180.0 * M_PI)   //360
        path.addArcWithCenter(CGPointMake(self.frame.size.width/2.0, self.frame.size.width/2.0), radius: self.frame.size.width/2.0, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        
        return path.CGPath
    }
    
    private var crossPath: CGPath  {
        let path = UIBezierPath()
        let factor:CGFloat = self.frame.size.width / 5.0
        path.moveToPoint(CGPoint(x: self.frame.size.height/2.0-factor,y: self.frame.size.height/2.0-factor))
        path.addLineToPoint(CGPoint(x: self.frame.size.height/2.0+factor,y: self.frame.size.height/2.0+factor))
        path.moveToPoint(CGPoint(x: self.frame.size.height/2.0+factor,y: self.frame.size.height/2.0-factor))
        path.addLineToPoint(CGPoint(x: self.frame.size.height/2.0-factor,y: self.frame.size.height/2.0+factor))
        
        return path.CGPath
    }
    
    private func setupLayers() {
        circleLayer.path = outlineCircle
        circleLayer.fillColor = UIColor.clearColor().CGColor;
        circleLayer.strokeColor = UIColor.colorWithHex(0xF27474).CGColor;
        circleLayer.lineCap = kCALineCapRound
        circleLayer.lineWidth = 4;
        circleLayer.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        circleLayer.position = CGPoint(x: self.frame.size.width/2.0, y: self.frame.size.height/2.0)
        self.layer.addSublayer(circleLayer)
        
        crossPathLayer.path = crossPath
        crossPathLayer.fillColor = UIColor.clearColor().CGColor;
        crossPathLayer.strokeColor = UIColor.colorWithHex(0xF27474).CGColor;
        crossPathLayer.lineCap = kCALineCapRound
        crossPathLayer.lineWidth = 4;
        crossPathLayer.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        crossPathLayer.position = CGPoint(x: self.frame.size.width/2.0, y: self.frame.size.height/2.0)
        self.layer.addSublayer(crossPathLayer)
        
    }
    
    override func animate() {
        var t = CATransform3DIdentity;
        t.m34 = 1.0 / -500.0;
        t = CATransform3DRotate(t, CGFloat(90.0 * M_PI / 180.0), 1, 0, 0);
        
        var t2 = CATransform3DIdentity;
        t2.m34 = 1.0 / -500.0;
        t2 = CATransform3DRotate(t2, CGFloat(-M_PI), 1, 0, 0);
        
        let animation = CABasicAnimation(keyPath: "transform")
        let time = 0.3
        animation.duration = time;
        animation.fromValue = NSValue(CATransform3D: t)
        animation.toValue = NSValue(CATransform3D:t2)
        animation.removedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        self.circleLayer.addAnimation(animation, forKey: "transform")
        
        
        var scale = CATransform3DIdentity;
        scale = CATransform3DScale(scale, 0.3, 0.3, 0)
        
        let crossAnimation = CABasicAnimation(keyPath: "transform")
        crossAnimation.duration = 0.3;
        crossAnimation.beginTime = CACurrentMediaTime() + time
        crossAnimation.fromValue = NSValue(CATransform3D: scale)
        crossAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0.8, 0.7, 2.0)
        crossAnimation.toValue = NSValue(CATransform3D:CATransform3DIdentity)
        self.crossPathLayer.addAnimation(crossAnimation, forKey: "scale")
        
        let fadeInAnimation = CABasicAnimation(keyPath: "opacity")
        fadeInAnimation.duration = 0.3;
        fadeInAnimation.beginTime = CACurrentMediaTime() + time
        fadeInAnimation.fromValue = 0.3
        fadeInAnimation.toValue = 1.0
        fadeInAnimation.removedOnCompletion = false
        fadeInAnimation.fillMode = kCAFillModeForwards
        self.crossPathLayer.addAnimation(fadeInAnimation, forKey: "opacity")
    }
}

class InfoAnimatedView: AnimatableView {
    
    var circleLayer = CAShapeLayer()
    var crossPathLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayers()
    }
    
    override func layoutSubviews() {
        setupLayers()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var outlineCircle: CGPath  {
        let path = UIBezierPath()
        let startAngle: CGFloat = CGFloat((0) / 180.0 * M_PI)  //0
        let endAngle: CGFloat = CGFloat((360) / 180.0 * M_PI)   //360
        path.addArcWithCenter(CGPointMake(self.frame.size.width/2.0, self.frame.size.width/2.0), radius: self.frame.size.width/2.0, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        
        let factor:CGFloat = self.frame.size.width / 1.5
        path.moveToPoint(CGPoint(x: self.frame.size.width/2.0 , y: 15.0))
        path.addLineToPoint(CGPoint(x: self.frame.size.width/2.0,y: factor))
        path.moveToPoint(CGPoint(x: self.frame.size.width/2.0,y: factor + 10.0))
        path.addArcWithCenter(CGPoint(x: self.frame.size.width/2.0,y: factor + 10.0), radius: 1.0, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        return path.CGPath
    }
    
    func setupLayers() {
        circleLayer.path = outlineCircle
        circleLayer.fillColor = UIColor.clearColor().CGColor;
        circleLayer.strokeColor = UIColor.colorWithHex(0xF8D486).CGColor;
        circleLayer.lineCap = kCALineCapRound
        circleLayer.lineWidth = 4;
        circleLayer.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        circleLayer.position = CGPoint(x: self.frame.size.width/2.0, y: self.frame.size.height/2.0)
        self.layer.addSublayer(circleLayer)
    }
    
    override func animate() {
        
        let colorAnimation = CABasicAnimation(keyPath:"strokeColor")
        colorAnimation.duration = 1.0;
        colorAnimation.repeatCount = HUGE
        colorAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        colorAnimation.autoreverses = true
        colorAnimation.fromValue = UIColor.colorWithHex(0xF7D58B).CGColor
        colorAnimation.toValue = UIColor.colorWithHex(0xF2A665).CGColor
        circleLayer.addAnimation(colorAnimation, forKey: "strokeColor")
    }
}


class SuccessAnimatedView: AnimatableView {
    
    var circleLayer = CAShapeLayer()
    var outlineLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayers()
        circleLayer.strokeStart = 0.0
        circleLayer.strokeEnd = 0.0
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setupLayers()
    }
    
    
    var outlineCircle: CGPath {
        let path = UIBezierPath()
        let startAngle: CGFloat = CGFloat((0) / 180.0 * M_PI)  //0
        let endAngle: CGFloat = CGFloat((360) / 180.0 * M_PI)   //360
        path.addArcWithCenter(CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0), radius: self.frame.size.width/2.0, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        return path.CGPath
    }
    
    var path: CGPath {
        let path = UIBezierPath()
        let startAngle:CGFloat = CGFloat((60) / 180.0 * M_PI) //60
        let endAngle:CGFloat = CGFloat((200) / 180.0 * M_PI)  //190
        path.addArcWithCenter(CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0), radius: self.frame.size.width/2.0, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        path.addLineToPoint(CGPoint(x: 36.0 - 10.0 ,y: 60.0 - 10.0))
        path.addLineToPoint(CGPoint(x: 85.0 - 20.0, y: 30.0 - 20.0))
        return path.CGPath
    }
    
    
    func setupLayers() {
        
        outlineLayer.position = CGPointMake(0,
            0);
        outlineLayer.path = outlineCircle
        outlineLayer.fillColor = UIColor.clearColor().CGColor;
        outlineLayer.strokeColor = UIColor(red: 150.0/255.0, green: 216.0/255.0, blue: 115.0/255.0, alpha: 1.0).CGColor;
        outlineLayer.lineCap = kCALineCapRound
        outlineLayer.lineWidth = 4;
        outlineLayer.opacity = 0.1
        self.layer.addSublayer(outlineLayer)
        
        circleLayer.position = CGPointMake(0,
            0);
        circleLayer.path = path
        circleLayer.fillColor = UIColor.clearColor().CGColor;
        circleLayer.strokeColor = UIColor(red: 150.0/255.0, green: 216.0/255.0, blue: 115.0/255.0, alpha: 1.0).CGColor;
        circleLayer.lineCap = kCALineCapRound
        circleLayer.lineWidth = 4;
        circleLayer.actions = [
            "strokeStart": NSNull(),
            "strokeEnd": NSNull(),
            "transform": NSNull()
        ]
        self.layer.addSublayer(circleLayer)
    }
    
    override func animate() {
        let strokeStart = CABasicAnimation(keyPath: "strokeStart")
        let strokeEnd = CABasicAnimation(keyPath: "strokeEnd")
        let factor = 0.045
        strokeEnd.fromValue = 0.00
        strokeEnd.toValue = 0.93
        strokeEnd.duration = 10.0*factor
        let timing = CAMediaTimingFunction(controlPoints: 0.3, 0.6, 0.8, 1.2)
        strokeEnd.timingFunction = timing
        
        strokeStart.fromValue = 0.0
        strokeStart.toValue = 0.68
        strokeStart.duration =  7.0*factor
        strokeStart.beginTime =  CACurrentMediaTime() + 3.0*factor
        strokeStart.fillMode = kCAFillModeBackwards
        strokeStart.timingFunction = timing
        circleLayer.strokeStart = 0.68
        circleLayer.strokeEnd = 0.93
        self.circleLayer.addAnimation(strokeEnd, forKey: "strokeEnd")
        self.circleLayer.addAnimation(strokeStart, forKey: "strokeStart")
    }
    
}


