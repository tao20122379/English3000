//
//  Utilities.swift
//  QA Social
//
//  Created by luckymanbk on 6/16/16.
//  Copyright © 2016 Le Thanh Dat. All rights reserved.
//

import Foundation
import UIKit

extension String {
    /// Return the length of a string
    var length : Int {
        return self.characters.count
    }
}

extension UIColor {
    
    /**
     creates a UIColor from a hex string
     
     - parameter hex: Hex string with format "#cccccc"
     
     - returns: a UIColor object
     */
    class func colorFromHexString(hex:String) -> UIColor {
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet() as NSCharacterSet).uppercaseString
        
        if (cString.hasPrefix("#")) {
            cString = cString.substringFromIndex(cString.startIndex.advancedBy(1))
        }
        
        if (cString.characters.count != 6) {
            return UIColor.grayColor()
        }
        
        var rgbValue:UInt32 = 0
        NSScanner(string: cString).scanHexInt(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

@objc class  Utilities: NSObject {
    
    static let shareManager = Utilities()
    static let screenWidth = CGRectGetWidth(UIScreen.mainScreen().bounds)
    static let screenHeight = CGRectGetHeight(UIScreen.mainScreen().bounds) - 64

    /**
     * @brief: Get object from NSUserDefault
     **/
    func getObject(key: String) -> AnyObject? {
        let object: AnyObject? = NSUserDefaults.standardUserDefaults().objectForKey(key)
        if let obj: AnyObject = object {
            return NSKeyedUnarchiver.unarchiveObjectWithData(obj as! NSData)
        } else {
            return nil
        }
    }
    
    /**
     * @brief: Set object to NSUserDefault
     **/
    func setObject(object: AnyObject?, key: String) {
        let data = NSKeyedArchiver.archivedDataWithRootObject(object!)
        let userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(data, forKey: key)
        userDefaults.synchronize()
    }
    
    func dateStringFormatter(date: NSDate, dateFormat: String) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = dateFormat // "yyyy-MM-dd'T'HH:mm:ss+00:00"
        //dateFormatter.timeZone = NSTimeZone(abbreviation: "JST")
        dateFormatter.timeZone = NSTimeZone(abbreviation: "UTC")
        let dateInString: String = dateFormatter.stringFromDate(date)
        return dateInString
    }
    
    /**
     * @brief: Convert unixtime  to Date string
     **/
    func convertUnixtime(timeResult: Double) -> String {
        let epocTime = NSTimeInterval(timeResult)
        let myDate = NSDate(timeIntervalSince1970: epocTime)
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = Constants().LANGTEXT("DATE_FORMAT")
        let createDateFormat = dateFormatter.stringFromDate(myDate)
        return createDateFormat
    }
    


    
}