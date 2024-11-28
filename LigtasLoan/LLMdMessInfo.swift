//
//  LLMdMessInfo.swift
//  LigtasLoan
//
//  Created by LigtasLoan on 2024/11/4.
//

import UIKit

let LLMAIO = "LL_BY_O"

class LLMdMessInfo: NSObject {

    static func bpOInfo(from model: LLLModel, proloID: String, st: String, jd: String, type: String) {
        var dict = ["increased": proloID,
                    "everyonewas": type,
                    "battalion": String(model.battalion),
                    "common": st,
                    "practicalmind": jd]
        
        let dict1 = [
            "statement": SaveIdentityConfig.huoidfv() ?? "",
            "itwere": SaveIdentityConfig.getidfa(),
            "strongest": String(model.strongest)]
        
        dict.merge(dict1) { (current, _) in current }
        
        let man = LLRequestManager()
        man.requestAPI(params: dict, pageURL: "/ll/kitchen/theyre/suddenly", method: .post) { result in
            if type == "1" {
                UserDefaults.standard.set("1", forKey: LLMAIO)
                UserDefaults.standard.synchronize()
            }
        }
    }
    
}

