//
//  LLDLInfo.swift
//  LigtasLoan
//
//  Created by LigtasLoan on 2024/10/23.
//

import UIKit
import SAMKeychain
import AdSupport
import SystemServices

let LL_LOGIN = "LL_LOGIN"

let LL_NID = "LL_NID"

protocol Loggable {
    var logDictionary: [String: String] { get }
}

enum LogInfoKey: String {
    case meal, inquiring, kitchen, cheerless, threep, codebaby, luageage, screamed, duty, blazed
}

extension UIDevice {
    var systemInfo: (name: String, version: String) {
        return (name: name, version: systemVersion)
    }
}

extension UserDefaults {
    var screamed: String {
        return string(forKey: LL_NID) ?? ""
    }
}

class LLDLInfo: NSObject, Loggable {
    
    static func savedlInfo(phone: String, sessionID: String) {
        UserDefaults.standard.set(sessionID, forKey: LL_NID)
        UserDefaults.standard.set(phone, forKey: LL_LOGIN)
    }
    
    static func removedlInfo() {
        [LL_LOGIN, LL_NID, LLMAIO].forEach { UserDefaults.standard.removeObject(forKey: $0) }
    }
    
    var logDictionary: [String: String] {
        let idfv = SaveIdentityConfig.huoidfv()
        let deviceInfo = UIDevice.current.systemInfo
        let logInfo: [LogInfoKey: String] = [
            .meal: "ios",
            .inquiring: "1.0.0",
            .kitchen: deviceInfo.name,
            .cheerless: idfv,
            .threep: "peace",
            .codebaby: "old",
            .luageage: "jsandjava",
            .screamed: UserDefaults.standard.screamed,
            .duty: deviceInfo.version,
            .blazed: idfv,
        ]
        return logInfo.reduce(into: [:]) { result, entry in
            result[entry.key.rawValue] = entry.value
        }
    }
    static func getLogiInfo() -> [String: String] {
        return LLDLInfo().logDictionary
    }
}




class WLInfo: NSObject {
    
    static func isVPNCd() -> String {
        guard let proxySettings = CFNetworkCopySystemProxySettings()?.takeUnretainedValue() as? [String: Any],
              let scopes = proxySettings["__SCOPED__"] as? [String: Any] else {
            return "0"
        }
        
        let vpnKeywords = ["tap", "tun", "ppp"]
        for key in scopes.keys {
            if vpnKeywords.contains(where: key.lowercased().contains) {
                return "1"
            }
        }
        return "0"
    }
}

class SaveIdentityConfig {
    
    private static let idfvKey = "idfv.lig.phh"
    private static let keychainService = "com.app.apo.123"
    
    static func huoidfv() -> String {
        if let uuid = SAMKeychain.password(forService: keychainService, account: idfvKey), !uuid.isEmpty {
            return uuid
        } else {
            if let deviceIDFV = UIDevice.current.identifierForVendor?.uuidString {
                let success = SAMKeychain.setPassword(deviceIDFV, forService: keychainService, account: idfvKey)
                if success {
                    return deviceIDFV
                } else {
                    return ""
                }
            } else {
                return ""
            }
        }
    }
    
    static func getidfa() -> String {
        return ASIdentifierManager.shared().advertisingIdentifier.uuidString
    }
}

class LLSBOneDict {
    static func getLastTimeMillis() -> String {
        let uptime = ProcessInfo.processInfo.systemUptime
        let lastLoginDate = Date(timeIntervalSinceNow: -uptime)
        return String(format: "%ld", Int(lastLoginDate.timeIntervalSince1970 * 1000))
    }
    static func onesheinfo() -> [String: Any] {
        let batteryLevel = SystemServices().batteryLevel
        let batteryState = SystemServices().charging ? 1 : 0
        return [
            "unmistakable": UIDevice.current.systemVersion,
            "humming": getLastTimeMillis(),
            "crowdand": Bundle.main.bundleIdentifier ?? "",
            "cow": "blue",
            "disturbedbees": "iOS",
            "lo": "1",
            "murmuring": [
                "ominous": batteryLevel,
                "sleeve": batteryState
            ]
        ]
    }
}


class LLAllDict {
    static func sheAllnfo() -> [String: Any] {
        var dict: [String: Any] = ["all": "0"]
        let dict1 = LLSBOneDict.onesheinfo()
        let dict2 = LLSBTwoDict.twoinfoff()
        let dict3 = LLSBThreeDict.threeonfo()
        let dict4 = LLSBFourDict.fourinfo()
        let dict5 = LLSBFiveDict.fiveInfo()
        dict.merge(dict1) { (current, _) in current }
        dict.merge(dict2) { (current, _) in current }
        dict.merge(dict3) { (current, _) in current }
        dict.merge(dict4) { (current, _) in current }
        dict.merge(dict5) { (current, _) in current }
        return dict
    }
}


