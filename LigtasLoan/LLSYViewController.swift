//
//  LLSYViewController.swift
//  LigtasLoan
//
//  Created by LigtasLoan on 2024/10/22.
//

import UIKit
import RxSwift
import RxRelay
import MJRefresh
import CoreLocation
import RxGesture

class LLSYViewController: LLBaseViewController {
    
    lazy var oneView: OneView = {
        let oneView = OneView()
        oneView.isHidden = true
        return oneView
    }()
    
    lazy var twoView: TwoView = {
        let twoView = TwoView()
        twoView.isHidden = true
        return twoView
    }()
    
    var ksSt = BehaviorRelay<String>(value: "")
    
    var homeModel = BehaviorRelay<preferredaModel?>(value: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.addSubview(oneView)
        view.addSubview(twoView)
        oneView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        twoView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
      
        oneView.ctImageView.rx
            .tapGesture()
            .when(.recognized)
            .subscribe(onNext: { [weak self] _ in
                self?.homeClick()
            }).disposed(by: disposeBag)
        
        oneView.scro.mj_header = MJRefreshNormalHeader(refreshingBlock: { [weak self] in
            self?.homeInfo()
        })
        twoView.tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: { [weak self] in
            self?.homeInfo()
        })
        
        homeModel.subscribe(onNext: { [weak self] model in
            if let self = self {
                self.twoView.model.accept(model)
                self.twoView.lunboView.reloadData()
                self.twoView.lunboTeiView.reloadData()
            }
            
        }).disposed(by: disposeBag)
        
        ksSt.accept(LLSBTwoDict.getCurrentTime())
        
        twoView.tableView.rx.modelSelected(aviolenceModel.self).subscribe(onNext: { [weak self] model in
            guard let self = self else { return }
            if let cad = model.cad {
                self.apply(from: cad)
            }
        }).disposed(by: disposeBag)
        
        twoView.block = { [weak self] url in
            self?.genjuurltovc(from: url)
        }
        
        let status  = CLLocationManager.locationServicesEnabled()
        
        if status {
            locationConfig = LLLocationConfig()
            locationConfig?.startUpdatingLocation { model in
            }
        }else {}
        
        
        oneView.priBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            let webvc = LLWYViewController()
            webvc.pageUrl.accept("\(h5_URL)/AgaranPesoPrivacyPolicy")
            self.navigationController?.pushViewController(webvc, animated: true)
        }).disposed(by: disposeBag)
        
        oneView.loanBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            let webvc = LLWYViewController()
            webvc.pageUrl.accept("\(h5_URL)/AgaranPesoLoanTerm")
            self.navigationController?.pushViewController(webvc, animated: true)
        }).disposed(by: disposeBag)
        
        oneView.traBtn.rx.tap.subscribe(onNext: { _ in
            LoadingManager.addLoadingView()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                ToastViewConfig.showToast(message: "We have received your feedback and sincerely appreciate your support. Thank you!")
                LoadingManager.hideLoadingView()
            }
        }).disposed(by: disposeBag)
        
        oneView.accountBtn.rx.tap.subscribe(onNext: { _ in
            LoadingManager.addLoadingView()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                ToastViewConfig.showToast(message: "We have received your feedback and sincerely appreciate your support. Thank you!")
                LoadingManager.hideLoadingView()
            }
        }).disposed(by: disposeBag)
        
        oneView.ballBtn.rx.tap.subscribe(onNext: { _ in
            LoadingManager.addLoadingView()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                ToastViewConfig.showToast(message: "We have received your feedback and sincerely appreciate your support. Thank you!")
                LoadingManager.hideLoadingView()
            }
        }).disposed(by: disposeBag)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        homeInfo()
    }
    
}

extension LLSYViewController {
    
    private func homeInfo() {
        LoadingManager.addLoadingView()
        let man = LLRequestManager()
        man.requestAPI(params: ["home": "misdeeds", "ancestors": "purple"], pageURL: "/ll/huntingsquire/enough/hishorses", method: .get) { [weak self] result in
            LoadingManager.hideLoadingView()
            self?.oneView.scro.mj_header?.endRefreshing()
            self?.twoView.tableView.mj_header?.endRefreshing()
            switch result {
            case .success(let success):
                let model = success.preferreda
                self?.homeModel.accept(model)
                if model.greaterone?.elemental != "apprehend5" {
                    self?.oneView.isHidden = false
                    self?.twoView.isHidden = true
                } else {
                    self?.oneView.isHidden = true
                    self?.twoView.isHidden = false
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
    private func homeClick() {
        //1yes，0no
        let gck = self.homeModel.value?.consciousness ?? 0
        let status = CLLocationManager.authorizationStatus()
        if gck == 1 {
            if status == .authorizedAlways || status == .authorizedWhenInUse {
                lldwsc()
            }else {
                showLocaqlAlert()
            }
        }else {
            lldwsc()
        }
    }
    
    private func lldwsc() {
        locationConfig = LLLocationConfig()
        locationConfig?.startUpdatingLocation { [weak self] model in
            guard let self = self else { return }
            loanInfo(model)
            moneinfo(model)
            sbscinfo(model)
        }
        self.apply(from: self.homeModel.value?.nothave?.aviolence?.first?.cad ?? "")
    }
    
    private func showLocaqlAlert() {
        let alert = UIAlertController(
            title: "Location Access Necessary",
            message: "To move forward, grant Location permissions in your Settings.",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "To Settings", style: .default) { _ in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url)
            }
        })
        self.present(alert, animated: true)
    }
    
    private func loanInfo(_ model: LLLModel) {
        let man = LLRequestManager()
        let dict = ["tosee": model.tosee,
                    "unfeigned": model.unfeigned,
                    "battalion": String(model.battalion),
                    "library": model.library,
                    "mocking": LLSBTwoDict.getCurrentTime(),
                    "thatwas": model.thatwas,
                    "strongest": String(model.strongest),
                    "godis": model.godis,
                    "remarked": "hand"]
        man.requestAPI(params: dict, pageURL: "/ll/thatmatched/yourknee/would", method: .post) { result in
            
        }
    }
    
    private func moneinfo(_ model: LLLModel) {
        let ssbino = UserDefaults.standard.object(forKey: LLMAIO) as? String ?? ""
        if ssbino.isEmpty {
            LLMdMessInfo.bpOInfo(from: model, proloID: self.homeModel.value?.greaterone?.aviolence?.first?.cad ?? "", st:ksSt.value, jd: LLSBTwoDict.getCurrentTime(), type: "1")
        }
    }
    
    private func sbscinfo(_ model: LLLModel) {
        let man = LLRequestManager()
        let jsonData = try? JSONSerialization.data(withJSONObject: LLAllDict.sheAllnfo())
        let base64EncodedString = jsonData?.base64EncodedString() ?? ""
        let dict = ["preferreda": base64EncodedString, "minfo": "mi", "global": "1"]
        man.requestAPI(params: dict, pageURL: "/ll/sticking/wooddrill/again", method: .post) { result in
            
        }
    }
    
}


