//
//  LLZCViewController.swift
//  LigtasLoan
//
//  Created by LigtasLoan on 2024/10/22.
//

import UIKit
import RxSwift
import RxRelay

class LLZCViewController: LLBaseViewController {
    
    lazy var loginView: LLDLView = {
        let loginView = LLDLView()
        loginView.nextBtn.isEnabled = false
        return loginView
    }()
        
    var codeStr = BehaviorRelay<String>(value: "")
    
    var codeTime = 60
    
    var codeTimer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.addSubview(loginView)
        loginView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        loginView.phoneTx
            .rx
            .text
            .orEmpty
            .distinctUntilChanged()
            .observe(on: MainScheduler.asyncInstance)
            .subscribe(onNext: { [weak self] text in
                guard let self = self else { return }
                if text.count > 0 {
                    if text.count == 10 {
                        view.endEditing(true)
                    }
                    loginView.nextBtn.isEnabled = true
                    loginView.nextBtn.setBackgroundImage(UIImage(named: "nextimagebbt"), for: .normal)
                }else {
                    loginView.nextBtn.isEnabled = false
                    loginView.nextBtn.setBackgroundImage(UIImage(named: "nextimagebbt"), for: .normal)
                }
            })
            .disposed(by: disposeBag)
        
        loginView.codeTx.addTarget(self, action: #selector(unitFieldEditingChanged(_:)), for: .editingChanged)

        tapClick()
        
        loginView.clickLabel.rx.tapGesture()
            .when(.recognized)
            .subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            let webvc = LLWYViewController()
            webvc.pageUrl.accept("\(h5_URL)/AgaranPesoPrivacyPolicy")
            self.navigationController?.pushViewController(webvc, animated: true)
        }).disposed(by: disposeBag)
        
    }
    
}

extension LLZCViewController {
    
    @objc func unitFieldEditingChanged(_ sender: UITextField) {
        if let textStr = sender.text, textStr.count > 0 {
            self.codeStr.accept(textStr)
            self.loginView.nextBtn.isEnabled = true
            self.loginView.nextBtn.setBackgroundImage(UIImage(named: "nextimagebbt"), for: .normal)
        }else {
            self.loginView.nextBtn.isEnabled = false
            self.loginView.nextBtn.setBackgroundImage(UIImage(named: "nextimagebbt"), for: .normal)
        }
     }
     
     private func tapClick() {
         self.loginView.codeBtn.rx.tap.subscribe(onNext: { [weak self] in
             guard let self = self else { return }
             yzmhuoqu(self.loginView.codeBtn)
         }).disposed(by: disposeBag)
         
         self.loginView.nextBtn.rx.tap.subscribe(onNext: { [weak self] in
             guard let self = self else { return }
             tologin()
         }).disposed(by: disposeBag)
     }
     
     private func yzmhuoqu(_ btn: UIButton) {
         LoadingManager.addLoadingView()
         let man = LLRequestManager()
         let dict = ["precepts": "code", "revealed": self.loginView.phoneTx.text ?? ""]
         man.requestAPI(params: dict, pageURL: "/ll/frequently/young/shoot", method: .post) { [weak self] result in
             LoadingManager.hideLoadingView()
             guard let self = self else { return }
             switch result {
             case .success(let success):
                 ToastViewConfig.showToast(message: success.whey)
                 btn.isEnabled = false
                 codeTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
                 break
             case .failure(_):
                 break
             }
         }
     }
     
     private func tologin() {
         LoadingManager.addLoadingView()
         let man = LLRequestManager()
         let dict = ["ofhurt": self.loginView.phoneTx.text ?? "",
                     "friendliness": codeStr.value,
                     "borders": "1"]
         man.requestAPI(params: dict, pageURL: "/ll/childhood/family/oversomething", method: .post) { result in
             LoadingManager.hideLoadingView()
             switch result {
             case .success(let success):
                 let model = success.preferreda
                 LLDLInfo.savedlInfo(phone: model.ofhurt ?? "", sessionID: model.screamed ?? "")
                 NotificationCenter.default.post(name: NSNotification.Name(ROOT_VC), object: nil)
                 break
             case .failure(_):
                 break
             }
         }
     }
     
     @objc func updateTime() {
         if codeTime > 0 {
             codeTime -= 1
             self.loginView.codeBtn.setTitle("(\(self.codeTime)s)", for: .normal)
         } else {
             endTimer()
         }
     }
     
     func endTimer() {
         codeTimer.invalidate()
         self.loginView.codeBtn.isEnabled = true
         self.loginView.codeBtn.setTitle("Resend", for: .normal)
         codeTime = 60
     }
    
}
