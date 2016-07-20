//
//  FontsHelper.swift
//  QA Social
//
//  Created by luckymanbk on 6/16/16.
//  Copyright © 2016 Le Thanh Dat. All rights reserved.
//

import UIKit

class FontsHelper: NSObject {
    
    static func fontHiraKakuProNW3WithSize(size: CGFloat) -> UIFont {
        return UIFont(name: "HiraKakuProN-W3", size: size) ?? UIFont.systemFontOfSize(size)
    }
    
    static func fontHiraKakuProNW6WithSize(size: CGFloat) -> UIFont {
        return UIFont(name: "HiraKakuProN-W6", size: size) ?? UIFont.systemFontOfSize(size)
    }
    
    static func fontHelveticaWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: "Helvetica", size: size) ?? UIFont.systemFontOfSize(size)
    }
    
    static func fontHelveticaObliqueWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: "Helvetica-Oblique", size: size) ?? UIFont.systemFontOfSize(size)
    }
    
    static func fontHelveticaBoldObliqueWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: "Helvetica-BoldOblique", size: size) ?? UIFont.systemFontOfSize(size)
    }
    
    static func fontHelveticaBoldWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: "Helvetica-Bold", size: size) ?? UIFont.systemFontOfSize(size)
    }
    
    static func fontHelveticaLightWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: "Helvetica-Light", size: size) ?? UIFont.systemFontOfSize(size)
    }
}