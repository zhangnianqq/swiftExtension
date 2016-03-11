

import UIKit


/* 遍历所有自定义颜色
var i = 0
for color in listNameOfColors.keys {
let tmpView = UIView.init(frame: CGRectMake(self.view.frame.size.width/CGFloat(colors.count)*CGFloat(i), 100, self.view.frame.size.width/CGFloat(colors.count), 100))
i++
tmpView.backgroundColor = UIColor.colorWithCSS(listNameOfColors[color]!)
view.addSubview(tmpView)
}
*/
let listNameOfColors: Dictionary<String, String> = [
    "aliceblue": "rgb(240,248,255)",
    "antiquewhite": "rgb(250,235,215)",
    "aqua": "rgb(0,255,255)",
    "aquamarine": "rgb(127,255,212)",
    "azure": "rgb(240,255,255)",
    "beige": "rgb(245,245,220)",
    "bisque": "rgb(255,228,196)",
    "black": "rgb(0,0,0)",
    "blanchedalmond": "rgb(255,235,205)",
    "blue": "rgb(0,0,255)",
    "blueviolet": "rgb(138,43,226)",
    "brown": "rgb(165,42,42)",
    "burlywood": "rgb(222,184,135)",
    "cadetblue": "rgb(95,158,160)",
    "chartreuse": "rgb(127,255,0)",
    "chocolate": "rgb(210,105,30)",
    "coral": "rgb(255,127,80)",
    "cornflowerblue": "rgb(100,149,237)",
    "cornsilk": "rgb(255,248,220)",
    "crimson": "rgb(220,20,60)",
    "cyan": "rgb(0,255,255)",
    "darkblue": "rgb(0,0,139)",
    "darkcyan": "rgb(0,139,139)",
    "darkgoldenrod": "rgb(184,134,11)",
    "darkgray": "rgb(169,169,169)",
    "darkgreen": "rgb(0,100,0)",
    "darkgrey": "rgb(169,169,169)",
    "darkkhaki": "rgb(189,183,107)",
    "darkmagenta": "rgb(139,0,139)",
    "darkolivegreen": "rgb(85,107,47)",
    "darkorange": "rgb(255,140,0)",
    "darkorchid": "rgb(153,50,204)",
    "darkred": "rgb(139,0,0)",
    "darksalmon": "rgb(233,150,122)",
    "darkseagreen": "rgb(143,188,143)",
    "darkslateblue": "rgb(72,61,139)",
    "darkslategray": "rgb(47,79,79)",
    "darkslategrey": "rgb(47,79,79)",
    "darkturquoise": "rgb(0,206,209)",
    "darkviolet": "rgb(148,0,211)",
    "deeppink": "rgb(255,20,147)",
    "deepskyblue": "rgb(0,191,255)",
    "dimgray": "rgb(105,105,105)",
    "dimgrey": "rgb(105,105,105)",
    "dodgerblue": "rgb(30,144,255)",
    "firebrick": "rgb(178,34,34)",
    "floralwhite": "rgb(255,250,240)",
    "forestgreen": "rgb(34,139,34)",
    "fuchsia": "rgb(255,0,255)",
    "gainsboro": "rgb(220,220,220)",
    "ghostwhite": "rgb(248,248,255)",
    "gold": "rgb(255,215,0)",
    "goldenrod": "rgb(218,165,32)",
    "gray": "rgb(128,128,128)",
    "green": "rgb(0,128,0)",
    "greenyellow": "rgb(173,255,47)",
    "grey": "rgb(128,128,128)",
    "honeydew": "rgb(240,255,240)",
    "hotpink": "rgb(255,105,180)",
    "indianred": "rgb(205,92,92)",
    "indigo": "rgb(75,0,130)",
    "ivory": "rgb(255,255,240)",
    "khaki": "rgb(240,230,140)",
    "lavender": "rgb(230,230,250)",
    "lavenderblush": "rgb(255,240,245)",
    "lawngreen": "rgb(124,252,0)",
    "lemonchiffon": "rgb(255,250,205)",
    "lightblue": "rgb(173,216,230)",
    "lightcoral": "rgb(240,128,128)",
    "lightcyan": "rgb(224,255,255)",
    "lightgoldenrodyellow": "rgb(250,250,210)",
    "lightgray": "rgb(211,211,211)",
    "lightgreen": "rgb(144,238,144)",
    "lightgrey": "rgb(211,211,211)",
    "lightpink": "rgb(255,182,193)",
    "lightsalmon": "rgb(255,160,122)",
    "lightseagreen": "rgb(32,178,170)",
    "lightskyblue": "rgb(135,206,250)",
    "lightslategray": "rgb(119,136,153)",
    "lightslategrey": "rgb(119,136,153)",
    "lightsteelblue": "rgb(176,196,222)",
    "lightyellow": "rgb(255,255,224)",
    "lime": "rgb(0,255,0)",
    "limegreen": "rgb(50,205,50)",
    "linen": "rgb(250,240,230)",
    "magenta": "rgb(255,0,255)",
    "maroon": "rgb(128,0,0)",
    "mediumaquamarine": "rgb(102,205,170)",
    "mediumblue": "rgb(0,0,205)",
    "mediumorchid": "rgb(186,85,211)",
    "mediumpurple": "rgb(147,112,219)",
    "mediumseagreen": "rgb(60,179,113)",
    "mediumslateblue": "rgb(123,104,238)",
    "mediumspringgreen": "rgb(0,250,154)",
    "mediumturquoise": "rgb(72,209,204)",
    "mediumvioletred": "rgb(199,21,133)",
    "midnightblue": "rgb(25,25,112)",
    "mintcream": "rgb(245,255,250)",
    "mistyrose": "rgb(255,228,225)",
    "moccasin": "rgb(255,228,181)",
    "navajowhite": "rgb(255,222,173)",
    "navy": "rgb(0,0,128)",
    "oldlace": "rgb(253,245,230)",
    "olive": "rgb(128,128,0)",
    "olivedrab": "rgb(107,142,35)",
    "orange": "rgb(255,165,0)",
    "orangered": "rgb(255,69,0)",
    "orchid": "rgb(218,112,214)",
    "palegoldenrod": "rgb(238,232,170)",
    "palegreen": "rgb(152,251,152)",
    "paleturquoise": "rgb(175,238,238)",
    "palevioletred": "rgb(219,112,147)",
    "papayawhip": "rgb(255,239,213)",
    "peachpuff": "rgb(255,218,185)",
    "peru": "rgb(205,133,63)",
    "pink": "rgb(255,192,203)",
    "plum": "rgb(221,160,221)",
    "powderblue": "rgb(176,224,230)",
    "purple": "rgb(128,0,128)",
    "red": "rgb(255,0,0)",
    "rosybrown": "rgb(188,143,143)",
    "royalblue": "rgb(65,105,225)",
    "saddlebrown": "rgb(139,69,19)",
    "salmon": "rgb(250,128,114)",
    "sandybrown": "rgb(244,164,96)",
    "seagreen": "rgb(46,139,87)",
    "seashell": "rgb(255,245,238)",
    "sienna": "rgb(160,82,45)",
    "silver": "rgb(192,192,192)",
    "skyblue": "rgb(135,206,235)",
    "slateblue": "rgb(106,90,205)",
    "slategray": "rgb(112,128,144)",
    "slategrey": "rgb(112,128,144)",
    "snow": "rgb(255,250,250)",
    "springgreen": "rgb(0,255,127)",
    "steelblue": "rgb(70,130,180)",
    "tan": "rgb(210,180,140)",
    "teal": "rgb(0,128,128)",
    "thistle": "rgb(216,191,216)",
    "tomato": "rgb(255,99,71)",
    "turquoise": "rgb(64,224,208)",
    "violet": "rgb(238,130,238)",
    "wheat": "rgb(245,222,179)",
    "white": "rgb(255,255,255)",
    "whitesmoke": "rgb(245,245,245)",
    "yellow": "rgb(255,255,0)",
    "yellowgreen": "rgb(154,205,50)"]


extension UIColor {
    /**
     16进制颜色转换 例：UIColor.colorWithHex(0xff2),
     UIColor.colorWithHex(0xff2222),UIColor.colorWithHex(0xff2222, alpha:0.5)
     
     - parameter hex:   颜色值 类似0xff2 0xff2222  的值
     - parameter alpha: 透明度
     
     - returns: 颜色对象
     */
    class func colorWithHex(hex:UInt32, alpha:Float = 1.0) -> UIColor {
        var red:Float = 0.0, green:Float = 0.0, blue:Float = 0.0, nAlpha:Float = alpha
        let hexString:String = String(format: "%03X", arguments: [UInt32(hex)])
        let length:Int = hexString.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)
        switch length {
        case 3:
            red = Float(Float((hex >> 8) & 0xF)/15.0)
            green = Float(Float((hex >> 4) & 0xF)/15.0)
            blue = Float(Float(hex & 0xF)/15.0)
        case 4:
            nAlpha = Float(Float((hex >> 12) & 0xF)/15.0)
            red = Float(Float((hex >> 8) & 0xF)/15.0)
            green = Float(Float((hex >> 4) & 0xF)/15.0)
            blue = Float(Float(hex & 0xF)/15.0)
        case 6:
            red = Float(Float((hex >> 16) & 0xFF)/255.0)
            green = Float(Float((hex >> 8) & 0xFF)/255.0)
            blue = Float(Float(hex & 0xFF)/255.0)
        case 8:
            nAlpha = Float(Float((hex >> 24) & 0xFF)/255.0)
            red = Float(Float((hex >> 16) & 0xFF)/255.0)
            green = Float(Float((hex >> 8) & 0xFF)/255.0)
            blue = Float(Float(hex & 0xFF)/255.0)
        default:
            break
        }
        return self.init(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(nAlpha))
    }
    
    /**
     16进制颜色转换 例如：UIColor.colorWithHexString("0xff2222"),
     UIColor.colorWithHexString("ff0000"),UIColor.colorWithHexString("#ff0000")
     
     - parameter string: 16进制字符串
     - parameter alpha:  透明度
     
     - returns: 颜色对象
     */
    class func colorWithHexString(string:String, alpha:Float = 1.0) -> UIColor {
        let colorString = string.stringByReplacingOccurrencesOfString("#", withString: "", options: [], range: nil).uppercaseString
        var red:Float = 0.0, green:Float = 0.0, blue:Float = 0.0, nAlpha:Float = alpha
        let length:Int = colorString.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)
        switch length {
        case 3:
            red   = self.colorHexComponent(colorString, start: 0, length: 1)
            green = self.colorHexComponent(colorString, start: 1, length: 1)
            blue  = self.colorHexComponent(colorString, start: 2, length: 1)
        case 4:
            nAlpha = self.colorHexComponent(colorString, start: 0, length: 1)
            red   = self.colorHexComponent(colorString, start: 1, length: 1)
            green = self.colorHexComponent(colorString, start: 2, length: 1)
            blue  = self.colorHexComponent(colorString, start: 3, length: 1)
        case 6:
            red   = self.colorHexComponent(colorString, start: 0, length: 2)
            green = self.colorHexComponent(colorString, start: 2, length: 2)
            blue  = self.colorHexComponent(colorString, start: 4, length: 2)
        case 8:
            nAlpha = self.colorHexComponent(colorString, start: 0, length: 2)
            red   = self.colorHexComponent(colorString, start: 2, length: 2)
            green = self.colorHexComponent(colorString, start: 4, length: 2)
            blue  = self.colorHexComponent(colorString, start: 6, length: 2)
        default:
            break
        }
        return self.init(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(nAlpha))
    }
    
    //颜色16进制
    class func colorHexComponent(string:String, start:Int, length:Int) -> Float {
        let subString = string.sub(start, length: length)
        let fullHex = length == 2 ? subString : String(format: "%@%@", arguments: [subString, subString])
        var hexComponent:UInt32 = UInt32()
        //        NSScanner.scannerWithString(fullHex).scanHexInt(&hexComponent)
        NSScanner(string: fullHex).scanHexInt(&hexComponent)
        return Float(hexComponent)/255.0
    }
    
    
     /**
     随机色 例：UIColor.randomColor(),UIColor.randomColor(0.5)
     
     - parameter alpha: 透明度
     
     - returns: 颜色对象
     */
    class func randomColor(alpha:Float = 1.0) -> UIColor {
        var red:Float = 0.0, green:Float = 0.0, blue:Float = 0.0
        var generated = false
        if generated == false {
            generated = true
            srandom(CUnsignedInt(time(nil)))
        }
        red = Float(random())/Float(RAND_MAX)
        green = Float(random())/Float(RAND_MAX)
        blue = Float(random())/Float(RAND_MAX)
        return self.init(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
    }
    
    //设置颜色
    class func colorWith(red: Int, green: Int, blue: Int, alpha: CGFloat) -> UIColor {
        let color = UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
        return color
    }
    
    /**
     颜色转换 例：UIColor.colorWithRGB("rgb(238,130,238)")
     
     - parameter rgb: 颜色字符串
     
     - returns: 颜色对象
     */
    class func colorWithRGB(rgb:String) -> UIColor {
        var rgbValue = rgb.lowercaseString
        if !rgbValue.hasPrefix("rgb") {
            return self.init()
        }
        rgbValue = rgbValue.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString:"rgba( )"))
        let values:[String] = rgbValue.componentsSeparatedByString(",")
        let hasAlpha = values.count == 4
        if values.count == 3 || hasAlpha {
            var hue:CFloat = CFloat(), saturation:CFloat = CFloat(), brightness:CFloat = CFloat(), alpha:CFloat = 1.0
            NSScanner(string: values[0]).scanFloat(&hue)
            NSScanner(string: values[1]).scanFloat(&saturation)
            NSScanner(string: values[2]).scanFloat(&brightness)
            if hasAlpha {
                NSScanner(string: values[3]).scanFloat(&alpha)
            }
            return self.init(hue: CGFloat(hue/255.0), saturation: CGFloat(saturation/255.0), brightness: CGFloat(brightness/255.0), alpha: CGFloat(alpha))
        }
        return self.init()
    }
    
    /**
     css上的颜色转换 例：
     UIColor.colorWithCSS("ccc"),
     UIColor.colorWithCSS("#ccc"),
     UIColor.colorWithCSS("rgb(238,130,238"),
     UIColor.colorWithCSS("hsl(343, 100%, 50%, 1)"),
     
     - parameter css: css颜色
     
     - returns: 颜色对象
     */
    class func colorWithCSS(css:String) -> UIColor {
        if css.hasPrefix("rgb") {
            return colorWithRGB(css)
        } else if css.hasPrefix("hsl") {
            return colorWithHSL(css)
        } else if css.hasPrefix("0x") {
            var hexInt:UInt32 = UInt32()
            NSScanner(string: css).scanHexInt(&hexInt)
            return colorWithHex(hexInt)
        } else {
            return colorWithHexString(css)
        }
    }
    
    /**
     hsl颜色转换 例：UIColor.colorWithHSL("hsl(343,130,238)")
     
     - parameter hsl: hsl颜色值
     
     - returns: 颜色对象
     */
    class func colorWithHSL(hsl:String) -> UIColor {
        var hslValue = hsl.lowercaseString
        if !hslValue.hasPrefix("hsl") {
            return self.init()
        }
        hslValue = hslValue.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString:"hsla(%) "))
        let values:[String] = hslValue.componentsSeparatedByString(",")
        let hasAlpha = values.count == 4
        if values.count == 3 || hasAlpha {
            var hue:CFloat = CFloat(), saturation:CFloat = CFloat(), brightness:CFloat = CFloat(), alpha:CFloat = 1.0
            NSScanner(string: values[0]).scanFloat(&hue)
            NSScanner(string: values[1]).scanFloat(&saturation)
            NSScanner(string: values[2]).scanFloat(&brightness)
            if hasAlpha {
                NSScanner(string: values[3]).scanFloat(&alpha)
            }
            return self.init(hue: CGFloat(hue/255.0), saturation: CGFloat(saturation/255.0), brightness: CGFloat(brightness/255.0), alpha: CGFloat(alpha))
            
        }
        return self.init()
    }
    
    
    
    //以下为自定义颜色
    class func aliceBlueColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["aliceblue"]!)
    }
    
    class func antiqueWhiteColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["antiquewhite"]!)
    }
    
    class func aquaColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["aqua"]!)
    }
    
    class func aquamarineColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["aquamarine"]!)
    }
    
    class func azureColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["azure"]!)
    }
    
    class func beigeColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["beige"]!)
    }
    
    class func bisqueColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["bisque"]!)
    }
    
    class func blanchedAlmondColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["blanchedalmond"]!)
    }
    
    class func blueVioletColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["blueviolet"]!)
    }
    
    class func burlyWoodColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["burlywood"]!)
    }
    
    class func cadetBlueColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["cadetblue"]!)
    }
    
    class func chartreuseColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["chartreuse"]!)
    }
    
    class func chocolateColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["chocolate"]!)
    }
    
    class func coralColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["coral"]!)
    }
    
    class func cornflowerBlueColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["cornflowerblue"]!)
    }
    
    class func cornSilkColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["cornsilk"]!)
    }
    
    class func crimsonColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["crimson"]!)
    }
    
    class func darkBlueColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["darkblue"]!)
    }
    
    class func darkCyanColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["darkcyan"]!)
    }
    
    class func darkGoldenrodColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["darkgoldenrod"]!)
    }
    
    class func darkGreenColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["darkgreen"]!)
    }
    
    class func darkGreyColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["darkgrey"]!)
    }
    
    class func darkKhakiColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["darkkhaki"]!)
    }
    
    class func darkMagentaColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["darkmagenta"]!)
    }
    
    class func darkOliveGreenColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["darkolivegreen"]!)
    }
    
    class func darkOrangeColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["bisque"]!)
    }
    
    class func darkOrchidColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["blanchedalmond"]!)
    }
    
    class func darkRedColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["darkred"]!)
    }
    
    class func darkSalmonColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["burlywood"]!)
    }
    
    class func darkSeaGreenColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["darkseagreen"]!)
    }
    
    class func darkSlateBlueColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["darkslateblue"]!)
    }
    
    class func darkSlateGrayColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["darkslategray"]!)
    }
    
    class func darkSlateGreyColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["darkslategrey"]!)
    }
    
    class func darkTurquoiseColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["darkturquoise"]!)
    }
    
    class func darkVioletColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["darkviolet"]!)
    }
    
    class func deepPinkColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["deeppink"]!)
    }
    
    class func deepSkyBlueColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["deepskyblue"]!)
    }
    
    class func dimGrayColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["dimgray"]!)
    }
    
    class func dodgerBlueColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["dodgerblue"]!)
    }
    
    class func firebrickColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["firebrick"]!)
    }
    
    class func floralWhiteColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["floralwhite"]!)
    }
    
    class func forestGreenColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["forestgreen"]!)
    }
    
    class func fuchsiaColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["fuchsia"]!)
    }
    
    class func gainsboroColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["gainsboro"]!)
    }
    
    class func ghostWhiteColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["ghostwhite"]!)
    }
    
    class func goldColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["gold"]!)
    }
    
    class func goldenrodColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["goldenrod"]!)
    }
    
    class func greenYellowColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["greenyellow"]!)
    }
    
    class func greyColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["grey"]!)
    }
    
    class func honeydewColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["honeydew"]!)
    }
    
    class func hotPinkColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["hotpink"]!)
    }
    
    class func indianRedColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["indianred"]!)
    }
    
    class func indigoColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["indigo"]!)
    }
    
    class func ivoryColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["ivory"]!)
    }
    
    class func khakiColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["khaki"]!)
    }
    
    class func lavenderColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["lavender"]!)
    }
    
    class func lavenderBlushColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["lavenderblush"]!)
    }
    
    class func lawnGreenColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["lawngreen"]!)
    }
    
    class func lemonChiffonColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["lemonchiffon"]!)
    }
    
    class func lightBlueColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["lightblue"]!)
    }
    
    class func lightCoralColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["lightcoral"]!)
    }
    
    class func lightGoldenrodYellowColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["lightgoldenrodyellow"]!)
    }
    
    class func lightGreenColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["lightgreen"]!)
    }
    
    class func lightGreyColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["lightgrey"]!)
    }
    
    class func lightPinkColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["lightpink"]!)
    }
    
    class func lightSalmonColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["lightsalmon"]!)
    }
    
    class func lightSeaGreenColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["lightseagreen"]!)
    }
    
    class func lightSkyBlueColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["lightskyblue"]!)
    }
    
    class func lightSlateGrayColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["lightslategray"]!)
    }
    
    class func lightSlateGreyColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["lightslategrey"]!)
    }
    
    class func lightSteelBlueColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["lightsteelblue"]!)
    }
    
    class func lightYellowColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["lightyellow"]!)
    }
    
    class func limeColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["lime"]!)
    }
    
    class func limeGreenColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["limegreen"]!)
    }
    
    class func linenColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["linen"]!)
    }
    
    class func maroonColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["maroon"]!)
    }
    
    class func mediumAquamarineColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["mediumaquamarine"]!)
    }
    
    class func mediumBlueColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["mediumblue"]!)
    }
    
    class func mediumOrchidColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["mediumorchid"]!)
    }
    
    class func mediumPurpleColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["mediumpurple"]!)
    }
    
    class func mediumSeaGreenColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["mediumseagreen"]!)
    }
    
    class func mediumSlateBlueColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["mediumslateblue"]!)
    }
    
    class func mediumSpringGreenColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["mediumspringgreen"]!)
    }
    
    class func mediumTurquoiseColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["mediumturquoise"]!)
    }
    
    class func mediumVioletRedColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["mediumvioletred"]!)
    }
    
    class func midnightBlueColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["midnightblue"]!)
    }
    
    class func mintCreamColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["mintcream"]!)
    }
    
    class func mistyRoseColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["mistyrose"]!)
    }
    
    class func moccasinColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["moccasin"]!)
    }
    
    class func navajoWhiteColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["navajowhite"]!)
    }
    
    class func navyColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["navy"]!)
    }
    
    class func oldLaceColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["oldlace"]!)
    }
    
    class func oliveColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["olive"]!)
    }
    
    class func oliveDrabColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["olivedrab"]!)
    }
    
    class func orangeRedColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["orangered"]!)
    }
    
    class func orchidColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["orchid"]!)
    }
    
    class func paleGoldenrodColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["palegoldenrod"]!)
    }
    
    class func paleGreenColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["palegreen"]!)
    }
    
    class func paleTurquoiseColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["paleturquoise"]!)
    }
    
    class func paleVioletredColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["palevioletred"]!)
    }
    
    class func papayawhipColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["papayawhip"]!)
    }
    
    class func peachpuffColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["peachpuff"]!)
    }
    
    class func peruColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["peru"]!)
    }
    
    class func pinkColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["pink"]!)
    }
    
    class func plumColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["plum"]!)
    }
    
    class func powderBlueColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["powderblue"]!)
    }
    
    class func rosyBrownColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["rosybrown"]!)
    }
    
    class func royalBlueColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["royalblue"]!)
    }
    
    class func saddleBrownColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["saddlebrown"]!)
    }
    
    class func salmonColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["salmon"]!)
    }
    
    class func sandyBrownColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["sandybrown"]!)
    }
    
    class func seaGreenColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["seagreen"]!)
    }
    
    class func seashellColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["seashell"]!)
    }
    
    class func siennaColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["sienna"]!)
    }
    
    class func silverColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["silver"]!)
    }
    
    class func skyBlueColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["skyblue"]!)
    }
    
    class func slateBlueColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["slateblue"]!)
    }
    
    class func slateGrayColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["slategray"]!)
    }
    
    class func slateGreyColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["slategrey"]!)
    }
    
    class func snowColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["snow"]!)
    }
    
    class func springGreenColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["springgreen"]!)
    }
    
    class func steelBlueColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["steelblue"]!)
    }
    
    class func tanColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["tan"]!)
    }
    
    class func tealColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["teal"]!)
    }
    
    class func thistleColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["thistle"]!)
    }
    
    class func tomatoColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["tomato"]!)
    }
    
    class func turquoiseColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["turquoise"]!)
    }
    
    class func violetColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["violet"]!)
    }
    
    class func wheatColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["wheat"]!)
    }
    
    class func whiteSmokeColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["whitesmoke"]!)
    }
    
    class func yellowGreenColor() -> UIColor! {
        return colorWithRGB(listNameOfColors["yellowgreen"]!)
    }
}
