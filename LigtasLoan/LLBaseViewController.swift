//
//  LLBaseViewController.swift
//  LigtasLoan
//
//  Created by LigtasLoan on 2024/10/12.
//

import UIKit
import RxSwift
import RxRelay

let schemeurl = "loan://app.ligtas.ios/"

class LLBaseViewController: UIViewController {
    
    lazy var emptyView: LLemptyView = {
        let emptyView = LLemptyView()
        return emptyView
    }()
    
    let disposeBag = DisposeBag()
    
    var ksshjinof = BehaviorRelay<String>(value: "")
    
    var locationConfig: LLLocationConfig?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = !self.isKind(of: LLWYViewController.self)
    }
    
}

extension LLBaseViewController {
    
    func apply(from proid: String) {
        LoadingManager.addLoadingView()
        let man = LLRequestManager()
        man.requestAPI(params: ["lo": proid, "knewdifferently": "1", "flirting": "love"], pageURL: "/ll/tarletonwho/faces/straight", method: .post) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                if success.andmammy == 0 || success.andmammy == 00 {
                    let nextUrl = success.preferreda.foryou ?? ""
                    self.genjuurltovc(from: nextUrl)
                }
                break
            case .failure(_):
                LoadingManager.hideLoadingView()
                break
            }
        }
    }
    
    func genjuurltovc(from nextUrl: String) {
        if nextUrl.hasPrefix("http") {
            handleWebView(url: nextUrl)
            return
        }
        
        guard nextUrl.hasPrefix(schemeurl), let url = URL(string: nextUrl) else { return }
        
        switch url.path {
        case "/mountainOnio":
            handleMountainOnio(url: url)
            
        case "/lemonLemonJa":
            handleLemonLemonJa(url: url)
            
        default:
            break
        }
    }
    
    private func handleWebView(url: String) {
        LoadingManager.hideLoadingView()
        let wv = LLWYViewController()
        wv.pageUrl.accept(url)
        self.navigationController?.pushViewController(wv, animated: true)
    }

    private func handleMountainOnio(url: URL) {
        guard let query = url.query,
              let lo = query.components(separatedBy: "=").last else { return }
        proDetailInfo(from: lo)
    }

    private func handleLemonLemonJa(url: URL) {
        guard let query = url.query,
              let productID = extractQueryParameter(query, key: "lo"),
              let orderID = extractQueryParameter(query, key: "acute") else { return }
        let bbVc = LLAddBankViewController()
        bbVc.numArray.accept([productID, orderID, "1"])
        self.navigationController?.pushViewController(bbVc, animated: true)
        print("Product ID: \(productID), Order ID: \(orderID)")
    }

    private func extractQueryParameter(_ query: String, key: String) -> String? {
        guard let rangeStart = query.range(of: "\(key)=")?.upperBound else { return nil }
        let substring = query[rangeStart...]
        if let rangeEnd = substring.range(of: "&")?.lowerBound {
            return String(substring[..<rangeEnd])
        } else {
            return String(substring)
        }
    }
    
    @objc func proDetailInfo(from proid: String) {
        let man = LLRequestManager()
        man.requestAPI(params: ["lo": proid, "sooddly": "1", "shoothim": "0"], pageURL: "/ll/another/between/healthy", method: .post) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                if success.andmammy == 0 || success.andmammy == 00 {
                    if let hisgold = success.preferreda.hisgold, let gabbling = hisgold.gabbling, !gabbling.isEmpty {
                        LoadingManager.hideLoadingView()
                        typeVc(form: gabbling, proid: proid)
                    }else {
                        if let foryou = success.preferreda.foryou, !foryou.isEmpty {
                            self.genjuurltovc(from: foryou)
                            return
                        }
                        if let trembling = success.preferreda.consternation?.trembling {
                            self.ddtovc(from: trembling, pro: proid)
                        }
                    }
                }
                break
            case .failure(_):
                LoadingManager.hideLoadingView()
                break
            }
        }
    }
    
    func pageinDetailInfo(from proid: String) {
        LoadingManager.addLoadingView()
        let man = LLRequestManager()
        man.requestAPI(params: ["lo": proid, "sooddly": "1", "shoothim": "0"], pageURL: "/ll/another/between/healthy", method: .post) { [weak self] result in
            guard let self = self else { return }
            ksshjinof.accept(LLSBTwoDict.getCurrentTime())
            switch result {
            case .success(let success):
                if success.andmammy == 0 || success.andmammy == 00 {
                    if let hisgold = success.preferreda.hisgold, let gabbling = hisgold.gabbling, !gabbling.isEmpty, gabbling != "eastern6" {
                        LoadingManager.hideLoadingView()
                        if gabbling == "eastern2" {
                            self.pageintypeVc(form: gabbling, proid: proid)
                        }
                    }else {
                        if let trembling = success.preferreda.consternation?.trembling {
                            self.ddtovc(from: trembling, pro: proid)
                        }
                    }
                }
                break
            case .failure(_):
                LoadingManager.hideLoadingView()
                break
            }
        }
    }
    
    func pageintypeVc(form type: String, proid: String) {
        switch type {
        case "eastern1":
            let listVc = LLTypeListViewController()
            listVc.lo.accept(proid)
            self.navigationController?.pushViewController(listVc, animated: true)
            break
        case "eastern2":
            let listVc = LLStepTwoViewController()
            listVc.lo.accept(proid)
            self.navigationController?.pushViewController(listVc, animated: true)
            break
        case "eastern3":
            let listVc = LLStepTHRViewController()
            listVc.lo.accept(proid)
            self.navigationController?.pushViewController(listVc, animated: true)
            break
        case "eastern4":
            let listVc = LLStepTFViewController()
            listVc.lo.accept(proid)
            self.navigationController?.pushViewController(listVc, animated: true)
            break
        case "eastern5":
            let listVc = LLQAWViewController()
            listVc.lo.accept(proid)
            self.navigationController?.pushViewController(listVc, animated: true)
            break
        default:
            break
        }
    }
    
    func typeVc(form type: String, proid: String) {
        let listVc = LLTypeListViewController()
        listVc.lo.accept(proid)
        self.navigationController?.pushViewController(listVc, animated: true)
        print("")
    }
    
    func pushlistvc() {
        if let viewControllers = navigationController?.viewControllers {
            var found = false
            for vc in viewControllers {
                if vc is LLTypeListViewController {
                    navigationController?.popToViewController(vc, animated: true)
                    found = true
                    break
                }
            }
            if !found {
                navigationController?.popToRootViewController(animated: true)
            }
        }
    }
    
    func nextvc(form type: String, proid: String) {
        if type == "eastern1" {
            self.huoquid(from: proid)
        } else if type == "eastern2" {
            let ne = LLStepTwoViewController()
            ne.lo.accept(proid)
            self.navigationController?.pushViewController(ne, animated: true)
        } else if type == "eastern3" {
            let ne = LLStepTHRViewController()
            ne.lo.accept(proid)
            self.navigationController?.pushViewController(ne, animated: true)
        } else if type == "eastern4" {
            let ne = LLStepTFViewController()
            ne.lo.accept(proid)
            self.navigationController?.pushViewController(ne, animated: true)
        } else if type == "eastern5" {
            let ne = LLQAWViewController()
            ne.lo.accept(proid)
            self.navigationController?.pushViewController(ne, animated: true)
        } else if type == "eastern6" {
            pageinDetailInfo(from: proid)
        }
    }
    
    func huoquid(from proid: String) {
        let man = LLRequestManager()
        LoadingManager.addLoadingView()
        man.requestAPI(params: ["lo": proid, "recallanything": "happy"], pageURL: "/ll/sitting/troop/affection", method: .get) { [weak self] result in
            LoadingManager.hideLoadingView()
            switch result {
            case .success(let success):
                let model = success.preferreda
                if let dully = model.toremember?.dully, let self = self {
                    if dully == 0 {
                        self.goIDvC(form: proid)
                    }else {
                        self.goca(form: proid)
                    }
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
    func goIDvC(form lo: String) {
        let vc = LLIDListViewController()
        vc.lo.accept(lo)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goca(form lo: String) {
        let vc = LLUploadIDViewController()
        vc.lo.accept(lo)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func handleStorySelection(_ model: widehallModel, cell: LLBtnClickCell) {
        let underthe = model.underthe ?? ""
        let hatred = model.hatred ?? ""
        switch underthe {
        case "story1":
            print("story1")
            if hatred.contains("Payday") {
                if let theirbeauty = model.theirbeauty {
                    let modelArray = TPopConfig.getTDetails(dataSourceArr: theirbeauty)
                    OneTwoThreePopConfig.popLastEnum(.city, cell.mlabel1, modelArray, model) {
                    }
                }
            }else {
                if let theirbeauty = model.theirbeauty {
                    let modelArray = OnePopConfig.getOneDetails(dataSourceArr: theirbeauty)
                    OneTwoThreePopConfig.popLastEnum(.province, cell.mlabel1, modelArray, model) {
                    }
                }
            }
        case "story2":
            print("story2")
        case "story3":
            print("story3")
            fetchStoryData(for: cell)
        case "story4":
            print("story4")
        default:
            break
        }
    }
    
    func fetchStoryData(for cell: LLBtnClickCell) {
        LoadingManager.addLoadingView()
        let man = LLRequestManager()
        man.requestAPI(params: ["": ""], pageURL: "/ll/after/tomcat/foreverrankled", method: .get) { result in
            LoadingManager.hideLoadingView()
            switch result {
            case .success(let success):
                if let unending = success.preferreda.unending, let model = cell.model.value {
                    let modelArray = SanPopConfig.SanChengArray(dataArr: unending)
                    OneTwoThreePopConfig.popLastEnum(.area, cell.mlabel1, modelArray, model) {
                    }
                }
            case .failure(let failure):
                print("\(failure.localizedDescription)")
            }
        }
    }
    
    func ddtovc(from oid: String, pro: String) {
        let odDict = ["comforting": "1", "finally": oid, "twinge": "owo", "marriedindia": "lg-sa"]
        let man = LLRequestManager()
        man.requestAPI(params: odDict, pageURL: "/ll/wonderedif/thenher/these", method: .post) { [weak self] result in
            LoadingManager.hideLoadingView()
            guard let self = self else { return }
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.nineinfo(form: pro)
                }
                LoadingManager.hideLoadingView()
                let nextUrl = success.preferreda.foryou ?? ""
                let wv = LLWYViewController()
                wv.pageUrl.accept(nextUrl)
                self.navigationController?.pushViewController(wv, animated: true)
                break
            case .failure(_):
                break
            }
        }
    }
    
    private func nineinfo(form prod: String) {
        let jd = LLSBTwoDict.getCurrentTime()
        locationConfig = LLLocationConfig()
        locationConfig?.startUpdatingLocation { [weak self] model in
            guard let self = self else { return }
            LLMdMessInfo.bpOInfo(from: model, proloID: prod, st:self.ksshjinof.value, jd: jd, type: "9")
        }
    }
    
}
