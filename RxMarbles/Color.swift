//
//  Color.swift
//  RxMarbles
//
//  Created by Yury Korolev on 1/22/16.
//  Copyright © 2016 AnjLab. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255,     "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255,   "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}

struct Color {
    
   
    static let nextLightBlue    = UIColor(netHex: 0x54C7FC)
    static let nextDarkYellow   = UIColor(netHex: 0xFFCD00)
    static let nextGreen        = UIColor(netHex: 0x44DB5E)
    static let nextOrange       = UIColor(netHex: 0xFF9600)
    static let nextBlue         = UIColor(netHex: 0x0076FF)
    static let nextViolet       = UIColor(netHex: 0xBD10E0)
    static let nextLighterBlue  = UIColor(netHex: 0x50E3C2)
    static let nextLightGreen   = UIColor(netHex: 0xB8E986)
    static let nextLightGray    = UIColor.lightGrayColor()
    
    static let black            = UIColor.blackColor()
   
    static var nextAll: [UIColor] {
        return [
            Color.nextLightBlue, Color.nextDarkYellow, Color.nextGreen,
            Color.nextOrange, Color.nextBlue, Color.nextViolet, Color.nextLightBlue,
            Color.nextLightGreen, Color.nextLightGray
        ]
    }
    
    static var nextRandom: UIColor {
        var allColors = nextAll
        allColors.removeLast()
        return allColors[random() % allColors.count]
    }
    
    
    static let codeDefault = Color.black
    static let codeNumber  = UIColor(netHex: 0x1C00CF)
    static let codeMethod  = UIColor(netHex: 0x26474B)
    static let codeKeyword = UIColor(netHex: 0xAA0D91)
    static let codeType    = UIColor(netHex: 0x3F6E74)
}
