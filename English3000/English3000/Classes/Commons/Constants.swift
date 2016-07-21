//
//  Defined.swift
//  QA Social
//
//  Created by PaditechDev1 on 6/14/16.
//  Copyright © 2016 PaditechDev1. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

// MARK: CompletionHandler
typealias CompletionHandler = (Bool, AnyObject?) -> ()


class Constants {
    //MARK: - Contants will use in all class
        
    // APP URL

    static let kVersion = ""
    static let kBaseImageURL = ""
    static let kTimeoutIntervalForRequest = NSTimeInterval(30)
    static let USER_AES256_ENCRYPT = "QA_SOCIAL"
    static let USER_INFOR_PATH = NSHomeDirectory().stringByAppendingString("/Documents/USERINFO")
    
    static let IOSVERSION = UIDevice.currentDevice().systemVersion .componentsSeparatedByString(".")[0]
    
    // CHECK IPhone and OS Version
    static let IS_IPAD = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad)
    static let IS_IPHONE = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Phone)
    static let IS_RETINA = (UIScreen.mainScreen().scale >= 2.0)
    static let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
    static let SCREEN_MAX_LENGTH = fmax(SCREEN_HEIGHT, SCREEN_WIDTH)
    static let SCREEN_MIN_LENGTH = fmin(SCREEN_WIDTH, SCREEN_HEIGHT)
    
    static let IS_IPHONE_4_OR_LESS = (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
    static let IS_IPHONE_5 = (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
    static let IS_IPHONE_6 = (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
    static let IS_IPHONE_6P = (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)
    
    static let IS_OS_5_OR_LATER = (Int(IOSVERSION) == 5)
    static let IS_OS_6_OR_LATER = (Int(IOSVERSION) == 6)
    static let IS_OS_7_OR_LATER = (Int(IOSVERSION) == 7)
    static let IS_OS_8_OR_LATER = (Int(IOSVERSION) == 8)
    static let IS_OS_9_OR_LATER = (Int(IOSVERSION) == 9)
    static let WINSIZE = UIApplication .sharedApplication().keyWindow?.frame.size
    static let SCREENSIZE = UIScreen.mainScreen().bounds.size
    
    static let iPhone568 = (WINSIZE?.height == 568.0)
    static let iPhone480 = (WINSIZE?.height <= 480.0)
    
    // Standard UserDefault
    static let SETTINGs = NSUserDefaults.standardUserDefaults()
    
    // Convinient function
    internal func RGBA2UIColor(red: Int, green: Int, blue: Int, alpha: CGFloat) -> UIColor{
        
        return UIColor(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: alpha)
    }
    
    internal func Rgb2UIColor(red: Int, green: Int, blue: Int) -> UIColor{
        
        return RGBA2UIColor(red, green: green, blue: blue, alpha: 1.0)
    }
    
    internal func radians(degrees: CGFloat)-> CGFloat{
        
        return (degrees * CGFloat(M_PI)/180)
    }
    
    internal func degrees(radians: CGFloat)-> CGFloat{
        
        return (radians * 180/CGFloat(M_PI))
    }
    
    internal func LANGTEXT(key: String)-> String{
        return NSLocalizedString(key, comment: "")
    }
    
    internal func stringReplaces(text: String, key: [String]) -> String {
        var textReplace = text
        key.forEach { (keyString) in
            textReplace = textReplace.stringByReplacingOccurrencesOfString(keyString, withString: "")
        }
        textReplace = self.stringSpecialCharactor(textReplace, keyString: ["ˈ"], withString: ["'"])
        return textReplace
    }
    
    internal func stringSpecialCharactor(text: String, keyString: [String], withString: [String]) -> String {
        var textSpecialFormat: String = text
        for i in 0..<keyString.count {
            textSpecialFormat = textSpecialFormat.stringByReplacingOccurrencesOfString(keyString[i], withString: withString[i])
        }
        return textSpecialFormat
    }
    
    
    internal func formatWordDetail(text: String) -> [String] {
        var textFormat = text
        textFormat = self.stringSpecialCharactor(textFormat, keyString: ["+", "\n="], withString: [":", "\n+"])
        return textFormat.componentsSeparatedByString("\n")
    }
    
    internal func checkWordLineType(text: String) -> WordLineType {
        if text.isEmpty {
            return .WordLineTypeNone
        }
        else {
            if text[text.startIndex] == "@" {
                return .WordLineTypeName
            }
            else if text[text.startIndex] == "*" {
                return .WordLineTypeTitle
            }
            else if text[text.startIndex] == "-" {
                return .WordLineTypeDetail1
            }
            else if text[text.startIndex] == "+" {
                return .WordLineTypeDetail2
            }
            else {
                return .WordLineTypeNone
            }
        }
    }
    

    
    // define font
    static let kRegularFont = UIFont(name: "Hiragino Sans", size: 13)
    
    // RegisterConstant
    struct RegisterMode {
        let kModeRegister: Int = 0
        let kModeEdit: Int = 1
    }
    
    // Notification
    static let kReloadUserNotification: String = "reloadUser"
    
    // Get user login
    
}
