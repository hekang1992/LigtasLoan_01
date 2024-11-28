//
//  LLDeTTInfo.swift
//  LigtasLoan
//
//  Created by LigtasLoan on 2024/11/4.
//

import DeviceKit
import SystemServices
import Toaster

class LLSBThreeDict {
    
    static func screenDimensions() -> (width: String, height: String) {
        let width = String(format: "%.0f", sc_width)
        let height = String(format: "%.0f", sc_height)
        return (width, height)
    }
    
    static func threeonfo() -> [String: Any] {
        let deviceName = Device.current.name ?? ""
        let deviceDescription = Device.current.description
        let deviceSystemVersion = Device.current.systemVersion ?? ""
        let (width, height) = screenDimensions()
        
        return [
            "three": ["three": "3"],
            "speaker": [
                "besidethe": "1",
                "stick": deviceName,
                "werebeginning": "lo",
                "evidently": height,
                "bloodcoming": deviceName,
                "harbors": width,
                "bottle": deviceDescription,
                "fleet": String(Device.current.diagonal),
                "theyankee": deviceSystemVersion
            ]
        ]
    }
}

class LLSBFourDict {
    
    static func fourinfo() -> [String: Any] {
        let currentIPAddress = SSNetworkInfo.currentIPAddress() ?? ""
        let appInfo = LLSBTwoDict.getAppssnfo()
        let macAddress = LLSBTwoDict.getMac()
        
        return [
            "four": ["four": "4"],
            "warship": [
                "tanneries": currentIPAddress,
                "foundries": [
                    "aquizzical": appInfo,
                    "mills": macAddress,
                    "shipyards": macAddress,
                    "woolen": appInfo
                ]
            ]
        ]
    }
}


class LLSBFiveDict {
    
    static func disk1() -> String {
        let freeDisk = String(format: "%.2lld", SystemServices.shared().longFreeDiskSpace)
        return freeDisk
    }
    
    static func disk2() -> String {
        let allDisk = String(format: "%.2lld", SystemServices.shared().longDiskSpace)
        return allDisk
    }
    
    static func disk3() -> String {
        let totalMemory = String(format: "%.0f", SystemServices.shared().totalMemory * 1024 * 1024)
        return totalMemory
    }
    
    static func disk4() -> String {
        let activeMemoryinRaw = String(format: "%.0f", SystemServices.shared().activeMemoryinRaw * 1024 * 1024)
        return activeMemoryinRaw
    }
    
    static func fiveInfo() -> [String: Any] {
        return [
            "five": "5",
            "themason": [
                "factory": disk1(),
                "cannon": disk2(),
                "outsider": disk3(),
                "thatsomehow": disk4()
            ]
        ]
    }
    
}

class ToastViewConfig {
    static func showToast(message: String) {
        ToastView.appearance().font = UIFont(name: Bold_SFDisplay, size: 20)
        let toast = Toast(text: message, duration: 1.0)
        if let window = UIApplication.shared.windows.first {
            let screenHeight = window.frame.size.height
            let toastHeight: CGFloat = 50
            let centerY = screenHeight / 2 - toastHeight / 2
            ToastView.appearance().bottomOffsetPortrait = centerY
            ToastView.appearance().bottomOffsetLandscape = centerY
        }
        toast.show()
    }
}
