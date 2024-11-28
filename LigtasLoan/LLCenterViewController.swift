//
//  LLCenterViewController.swift
//  LigtasLoan
//
//  Created by LigtasLoan on 2024/11/12.
//

import UIKit
import RxSwift
import TYAlertController









//##################################








class LLCenterViewController: LLBaseViewController {

    lazy var rightView: LLRightView = {
        let rightView = LLRightView()
        return rightView
    }()
    
    lazy var delView: DelView = {
        let delView = DelView(frame: UIScreen.main.bounds)
        return delView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(rightView)
        rightView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        tap()
    }

}


extension LLCenterViewController {
    
    private func tap() {
        rightView.itemView1.btn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            let setVc = LLAllDianViewController()
            self.navigationController?.pushViewController(setVc, animated: true)
        }).disposed(by: disposeBag)
        
        rightView.itemView2.btn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            let webvc = LLWYViewController()
            webvc.pageUrl.accept("\(h5_URL)")
            self.navigationController?.pushViewController(webvc, animated: true)
        }).disposed(by: disposeBag)
        
        rightView.itemView3.btn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            let webvc = LLWYViewController()
            webvc.pageUrl.accept("\(h5_URL)/raccoonQui")
            self.navigationController?.pushViewController(webvc, animated: true)
        }).disposed(by: disposeBag)
        
        rightView.itemView4.btn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            let setVc = LLSetingViewController()
            self.navigationController?.pushViewController(setVc, animated: true)
        }).disposed(by: disposeBag)
        
        rightView.itemView5.btn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.delView.ctImageView.image = UIImage(named: "dellimagepu")
            self.delView.btn1.setImage(UIImage(named: "aldel"), for: .normal)
            let alertVc = TYAlertController(alert: self.delView, preferredStyle: .alert)
            self.present(alertVc!, animated: true)
            self.delView.block = {
                self.delInfo()
            }
            self.delView.block1 = {
                self.dismiss(animated: true)
            }
        }).disposed(by: disposeBag)
        
        rightView.itemView6.btn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.delView.ctImageView.image = UIImage(named: "outimage")
            self.delView.btn1.setImage(UIImage(named: "eximIMGE"), for: .normal)
            let alertVc = TYAlertController(alert: self.delView, preferredStyle: .alert)
            self.present(alertVc!, animated: true)
            self.delView.block = {
                self.logInfo()
            }
            self.delView.block1 = {
                self.dismiss(animated: true)
            }
        }).disposed(by: disposeBag)
        
    }
    
    private func delInfo() {
        LoadingManager.addLoadingView()
        let man = LLRequestManager()
        man.requestAPI(params: ["del": "1", "cost": "cent"], pageURL: "/ll/education/social/gather", method: .get) { result in
            LoadingManager.hideLoadingView()
            switch result {
            case .success(let success):
                if success.andmammy == 0 || success.andmammy == 00 {
                    DispatchQueue.main.async {
                        LLDLInfo.removedlInfo()
                        NotificationCenter.default.post(name: NSNotification.Name(ROOT_VC), object: nil)
                    }
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
    private func logInfo() {
        LoadingManager.addLoadingView()
        let man = LLRequestManager()
        man.requestAPI(params: ["thatstupid": "1", "silenceanything": "trump"], pageURL: "/ll/mothers/spring/journeyed", method: .get) { result in
            LoadingManager.hideLoadingView()
            switch result {
            case .success(let success):
                if success.andmammy == 0 || success.andmammy == 00 {
                    DispatchQueue.main.async {
                        LLDLInfo.removedlInfo()
                        NotificationCenter.default.post(name: NSNotification.Name(ROOT_VC), object: nil)
                    }
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
    
}
