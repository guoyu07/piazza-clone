//
//  StringAndDateExtension.swift
//  Pizzazz
//
//  Created by Zach Zeleznick on 5/5/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//
import Foundation

extension String {
    
    static func random(_ length: Int = 20) -> String {
        
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString: String = ""
        
        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.characters.count))
            randomString += "\(base[base.characters.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        
        return randomString
    }
}

extension Date
{
    static func shortStringFromDate(_ date: Date) -> String
    {
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.short
        return formatter.string(from: date)
    }
}
