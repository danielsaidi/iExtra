//
//  UIDevice+Model.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-12-07.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIDevice {
    
    public var modelName: String? {
        var systemInfo = utsname()
        uname(&systemInfo)
        return withUnsafePointer(to: &systemInfo.machine) {
            $0.withMemoryRebound(to: CChar.self, capacity: 1) { ptr in
                String(validatingUTF8: ptr)
            }
        }
    }
    
    public var modelType: DeviceModelType {
        guard let name = modelName else { return .unknown }
        return DeviceModelType.from(modelName: name)
    }
}


// MARK: - DeviceModelType Extension

private extension DeviceModelType {
    
    static func from(modelName: String) -> DeviceModelType {
        switch modelName {
        case "i386": return .simulator
        case "x86_64": return .simulator
        case "AppleTV5,3": return .appleTV
        case "AppleTV6,2": return .appleTV4K
        case "AudioAccessory1,1": return .homepod
        case "iPod1,1": return .iPod1
        case "iPod2,1": return .iPod2
        case "iPod3,1": return .iPod3
        case "iPod4,1": return .iPod4
        case "iPod5,1": return .iPod5
        case "iPod7,1": return .iPod6
        case "iPad2,1": return .iPad2
        case "iPad2,2": return .iPad2
        case "iPad2,3": return .iPad2
        case "iPad2,4": return .iPad2
        case "iPad2,5": return .iPadMini1
        case "iPad2,6": return .iPadMini1
        case "iPad2,7": return .iPadMini1
        case "iPad3,1": return .iPad3
        case "iPad3,2": return .iPad3
        case "iPad3,3": return .iPad3
        case "iPad3,4": return .iPad4
        case "iPad3,5": return .iPad4
        case "iPad3,6": return .iPad4
        case "iPad4,1": return .iPadAir1
        case "iPad4,2": return .iPadAir1
        case "iPad4,3": return .iPadAir1
        case "iPad4,4": return .iPadMini2
        case "iPad4,5": return .iPadMini2
        case "iPad4,6": return .iPadMini2
        case "iPad4,7": return .iPadMini3
        case "iPad4,8": return .iPadMini3
        case "iPad4,9": return .iPadMini3
        case "iPad5,1": return .iPadMini4
        case "iPad5,2": return .iPadMini4
        case "iPad5,3": return .iPadAir2
        case "iPad5,4": return .iPadAir2
        case "iPad6,3": return .iPadPro9_7
        case "iPad6,4": return .iPadPro9_7
        case "iPad6,7": return .iPadPro12_9
        case "iPad6,8": return .iPadPro12_9
        case "iPad6,11": return .iPad5
        case "iPad6,12": return .iPad5
        case "iPad7,1": return .iPadPro12_9_2Gen
        case "iPad7,2": return .iPadPro12_9_2Gen
        case "iPad7,3": return .iPadPro10_5
        case "iPad7,4": return .iPadPro10_5
        case "iPhone3,1": return .iPhone4
        case "iPhone3,2": return .iPhone4
        case "iPhone3,3": return .iPhone4
        case "iPhone4,1": return .iPhone4S
        case "iPhone5,1": return .iPhone5
        case "iPhone5,2": return .iPhone5
        case "iPhone5,3": return .iPhone5C
        case "iPhone5,4": return .iPhone5C
        case "iPhone6,1": return .iPhone5S
        case "iPhone6,2": return .iPhone5S
        case "iPhone7,1": return .iPhone6plus
        case "iPhone7,2": return .iPhone6
        case "iPhone8,1": return .iPhone6S
        case "iPhone8,2": return .iPhone6Splus
        case "iPhone8,4": return .iPhoneSE
        case "iPhone9,1": return .iPhone7
        case "iPhone9,2": return .iPhone7plus
        case "iPhone9,3": return .iPhone7
        case "iPhone9,4": return .iPhone7plus
        case "iPhone10,1": return .iPhone8
        case "iPhone10,2": return .iPhone8plus
        case "iPhone10,3": return .iPhoneX
        case "iPhone10,4": return .iPhone8
        case "iPhone10,5": return .iPhone8plus
        case "iPhone10,6": return .iPhoneX
        default: return .unknown
        }
    }
}
