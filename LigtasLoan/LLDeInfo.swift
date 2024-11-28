//
//  LLDeInfo.swift
//  LigtasLoan
//
//  Created by LigtasLoan on 2024/11/4.
//

import SystemConfiguration.CaptiveNetwork
import DeviceKit
import SystemServices
import Alamofire

class LLSBTwoDict {
    
    static func getAppssnfo() -> String {
        guard let interfaces = CNCopySupportedInterfaces() as? [String],
              let interface = interfaces.first as CFString?,
              let networkInfo = CNCopyCurrentNetworkInfo(interface) as? [String: Any],
              let ssid = networkInfo["SSID"] as? String else {
            return ""
        }
        return ssid
    }
    
    static func getMac() -> String {
        guard let interfaces = CNCopySupportedInterfaces() as? [String] else {
            return ""
        }
        for interface in interfaces {
            guard let info = CNCopyCurrentNetworkInfo(interface as CFString) as? [String: Any],
                  let bssid = info[kCNNetworkInfoKeyBSSID as String] as? String else {
                continue
            }
            return bssid
        }
        return ""
    }
    
    static func getCurrentTime() -> String {
        let currentTime = Date().timeIntervalSince1970
        let currentTimeMillis = String(Int64(currentTime * 1000))
        return currentTimeMillis
    }
    
    static func is_Proxy() -> String {
        guard let proxySettings = CFNetworkCopySystemProxySettings()?.takeRetainedValue() as? [AnyHashable: Any],
              let proxies = CFNetworkCopyProxiesForURL(URL(string: "https://www.apple.com")! as CFURL, proxySettings as CFDictionary).takeRetainedValue() as? [[AnyHashable: Any]],
              let proxyType = proxies.first?[kCFProxyTypeKey] as? String else {
            return "0"
        }
        return proxyType == kCFProxyTypeNone as String ? "0" : "1"
    }
    
    static func is_ected() -> Bool {
        var zeroAddress = sockaddr()
        zeroAddress.sa_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sa_family = sa_family_t(AF_INET)
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }) else {
            return false
        }
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        return isReachable && !needsConnection
    }
    
    static func is_Break() -> String {
        let ac = "/Applications/Cydia.app"
        let bc = "/Library/MobileSubstrate/MobileSubstrate.dylib"
        let cc = "/bin/bash"
        let dc = "/usr/sbin/sshd"
        let ec = "/usr/sbin/sshd"
        let jailbreakToolPaths = [ac,bc,cc,dc,ec]
        for path in jailbreakToolPaths {
            if FileManager.default.fileExists(atPath: path) {
                return "1"
            }
        }
        return "0"
    }
    
    static func timeBoot() -> String {
        let systemUptime = ProcessInfo.processInfo.systemUptime
        return String(format: "%.0f", systemUptime * 1000)
    }
    
    static func netxing() -> String {
        var wifoni: String = "NONE"
        let reachabilityManager = NetworkReachabilityManager()
        let status = reachabilityManager?.status
        if status == .notReachable {
            wifoni = "NONE"
        } else if status == .reachable(.ethernetOrWiFi) {
            wifoni = "WIFI"
        } else if status == .reachable(.cellular) {
            wifoni = "5G/4G"
        }else {
            wifoni = "NONE"
        }
        return wifoni
    }
    
    static func twoinfoff() -> [String: Any] {
        var dict: [String: Any] = ["": ""]
        dict["two"] = ["two": "2"]
        dict["coalmines"] = [
            "quarrel": SaveIdentityConfig.huoidfv() ?? "",
            "seldomthat": SaveIdentityConfig.getidfa(),
            "shipyards": getMac(),
            "factories": getCurrentTime(),
            "thousands": is_Proxy(),
            "walf": "4",
            "andyou": "21",
            "seenmany": is_ected(),
            "presentknew": is_Break(),
            "is_simulator": Device.current.isSimulator ? "1" : "0",
            "fewyears": SystemServices().language ?? "",
            "believingthat": "you",
            "museums": netxing(),
            "orange": "deliclious",
            "guest": NSTimeZone.system.abbreviation() ?? "",
            "impress": timeBoot()
        ]
        return dict
    }
}


