//
//  LLTypeListViewController.swift
//  LigtasLoan
//
//  Created by LigtasLoan on 2024/10/25.
//

import UIKit
import RxRelay
import MJRefresh

class SelListView: UIView {
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .white
        return bgView
    }()
    
    lazy var backBtn: UIButton = {
        let backBtn = UIButton(type: .custom)
        backBtn.adjustsImageWhenHighlighted = false
        return backBtn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        bgView.addSubview(backBtn)
        
        bgView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        backBtn.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 375, height: 92))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class ListView: UIView {
    
    lazy var scro: UIScrollView = {
        let scro = UIScrollView()
        scro.backgroundColor = .white
        scro.showsHorizontalScrollIndicator = false
        scro.showsVerticalScrollIndicator = false
        scro.contentInsetAdjustmentBehavior = .never
        return scro
    }()
    
    lazy var backBtn: UIButton = {
        let backBtn = UIButton(type: .custom)
        return backBtn
    }()
    
    lazy var ctImageView: UIImageView = {
        let ctImageView = UIImageView()
        ctImageView.image = UIImage(named: "securefda")
        ctImageView.contentMode = .scaleAspectFill
        ctImageView.isUserInteractionEnabled = true
        return ctImageView
    }()
    
    lazy var listView1: SelListView = {
        let listView1 = SelListView()
        listView1.backBtn.setImage(UIImage(named: "Groid"), for: .normal)
        return listView1
    }()
    
    lazy var listView2: SelListView = {
        let listView2 = SelListView()
        listView2.backBtn.setImage(UIImage(named: "Groubas"), for: .normal)
        return listView2
    }()
    
    lazy var listView3: SelListView = {
        let listView3 = SelListView()
        listView3.backBtn.setImage(UIImage(named: "Grouwosk"), for: .normal)
        return listView3
    }()
    
    lazy var listView4: SelListView = {
        let listView4 = SelListView()
        listView4.backBtn.setImage(UIImage(named: "Groulixi"), for: .normal)
        return listView4
    }()
    
    lazy var listView5: SelListView = {
        let listView5 = SelListView()
        listView5.backBtn.setImage(UIImage(named: "Grouyinhna"), for: .normal)
        return listView5
    }()
    
    lazy var nextBtn: UIButton = {
        let nextBtn = UIButton(type: .custom)
        nextBtn.backgroundColor = UIColor.init(cssStr: "#222233")
        nextBtn.setTitle("GO CERTIFICATION PROGRAM", for: .normal)
        nextBtn.titleLabel?.font = UIFont(name: Bold_SFDisplay, size: 15)
        return nextBtn
    }()
    
    lazy var clickLabel: UILabel = {
        let clickLabel = UILabel()
        clickLabel.textAlignment = .left
        clickLabel.textColor = UIColor.init(cssStr: "#050506")?.withAlphaComponent(0.4)
        clickLabel.font = UIFont(name: Regular_SFDisplay, size: 14)
        clickLabel.numberOfLines = 0
        let fullText = "For comprehensive information on our data management practices, see our Privacy Policy."
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: "Privacy Policy")
        attributedString.addAttribute(.foregroundColor, value: UIColor.init(cssStr: "#2CE7BB")!, range: range)
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 14), range: range) // Make it bold
        clickLabel.attributedText = attributedString
        return clickLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(scro)
        scro.addSubview(ctImageView)
        ctImageView.addSubview(backBtn)
        scro.addSubview(listView1)
        scro.addSubview(listView2)
        scro.addSubview(listView3)
        scro.addSubview(listView4)
        scro.addSubview(listView5)
        addSubview(clickLabel)
        addSubview(nextBtn)
        scro.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(sc_height - 120)
        }
        ctImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.width.equalTo(sc_width)
            make.height.equalTo(334)
        }
        backBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(StatusBarHelper.getStatusBarHeight() - 10)
            make.left.equalToSuperview().offset(10)
            make.size.equalTo(CGSize(width: 80, height: 80))
        }
        listView1.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.width.equalTo(sc_width)
            make.height.equalTo(92)
            make.top.equalTo(ctImageView.snp.bottom).offset(1)
        }
        listView2.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.width.equalTo(sc_width)
            make.height.equalTo(92)
            make.top.equalTo(listView1.snp.bottom).offset(1)
        }
        listView3.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.width.equalTo(sc_width)
            make.height.equalTo(92)
            make.top.equalTo(listView2.snp.bottom).offset(1)
        }
        listView4.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.width.equalTo(sc_width)
            make.height.equalTo(92)
            make.top.equalTo(listView3.snp.bottom).offset(1)
        }
        listView5.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.width.equalTo(sc_width)
            make.height.equalTo(92)
            make.top.equalTo(listView4.snp.bottom).offset(1)
            make.bottom.equalToSuperview().offset(-20)
        }
        clickLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(21)
            make.width.equalTo(sc_width - 42)
            make.top.equalTo(nextBtn.snp.bottom).offset(32)
            make.bottom.equalToSuperview().offset(-30)
        }
        nextBtn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(12)
            make.bottom.equalTo(clickLabel.snp.top).offset(-20)
            make.height.equalTo(56)
            make.width.equalTo(sc_width - 25)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}




//++++++++++++++++++++++++++++++++++++++++++++++++++




class LLTypeListViewController: LLBaseViewController {
    
    var lo = BehaviorRelay<String>(value: "")
    
    var nextStr = BehaviorRelay<String>(value: "")
    
    lazy var listView: ListView = {
        let listView = ListView()
        return listView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(listView)
        listView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        listView.backBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.navigationController?.popViewController(animated: true)
        }).disposed(by: disposeBag)
        
        listView.listView1.backBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            let nextStr = self.nextStr.value
            if nextStr >= "eastern1" {
                self.huoquid(from: lo.value)
            }else {
                self.nextvc(form: self.nextStr.value, proid: self.lo.value)
            }
        }).disposed(by: disposeBag)
        
        listView.listView2.backBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            let nextStr = self.nextStr.value
            if nextStr >= "eastern2" {
                let ne = LLStepTwoViewController()
                ne.lo.accept(lo.value)
                self.navigationController?.pushViewController(ne, animated: true)
            }else {
                self.nextvc(form: self.nextStr.value, proid: self.lo.value)
            }
        }).disposed(by: disposeBag)
        
        listView.listView3.backBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            let nextStr = self.nextStr.value
            if nextStr >= "eastern3" {
                let ne = LLStepTHRViewController()
                ne.lo.accept(lo.value)
                self.navigationController?.pushViewController(ne, animated: true)
            }else {
                self.nextvc(form: self.nextStr.value, proid: self.lo.value)
            }
        }).disposed(by: disposeBag)
        
        listView.listView4.backBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            let nextStr = self.nextStr.value
            if nextStr >= "eastern4" {
                let ne = LLStepTFViewController()
                ne.lo.accept(lo.value)
                self.navigationController?.pushViewController(ne, animated: true)
            }else {
                self.nextvc(form: self.nextStr.value, proid: self.lo.value)
            }
        }).disposed(by: disposeBag)
        
        listView.listView5.backBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            let nextStr = self.nextStr.value
            if nextStr >= "eastern5" {
                let ne = LLQAWViewController()
                ne.lo.accept(lo.value)
                self.navigationController?.pushViewController(ne, animated: true)
            }else {
                self.nextvc(form: self.nextStr.value, proid: self.lo.value)
            }
        }).disposed(by: disposeBag)
        
        tapClick()
        
        
        self.listView.scro.mj_header = MJRefreshNormalHeader(refreshingBlock: { [weak self] in
            guard let self = self else { return }
            self.pproDetailInfo(from: self.lo.value)
        })
        
        listView.clickLabel.rx.tapGesture()
            .when(.recognized)
            .subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            let webvc = LLWYViewController()
            webvc.pageUrl.accept("\(h5_URL)/AgaranPesoPrivacyPolicy")
            self.navigationController?.pushViewController(webvc, animated: true)
        }).disposed(by: disposeBag)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            self.pproDetailInfo(from: self.lo.value)
        }
    }
    
}

extension LLTypeListViewController {
    
    private func tapClick() {
        listView.nextBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.nextvc(form: self.nextStr.value, proid: self.lo.value)
        }).disposed(by: disposeBag)
    }
    
     func pproDetailInfo(from proid: String) {
        LoadingManager.addLoadingView()
        let man = LLRequestManager()
        man.requestAPI(params: ["lo": proid, "sooddly": "1", "shoothim": "0"], pageURL: "/ll/another/between/healthy", method: .post) { [weak self] result in
            self?.listView.scro.mj_header?.endRefreshing()
            LoadingManager.hideLoadingView()
            guard let self = self else { return }
            switch result {
            case .success(let success):
                if success.andmammy == 0 || success.andmammy == 00 {
                    if let hisgold = success.preferreda.hisgold, let gabbling = hisgold.gabbling, !gabbling.isEmpty {
                        self.nextStr.accept(hisgold.gabbling ?? "")
                        self.nextListTy(form: hisgold.gabbling ?? "")
                    }else {
                        self.nextStr.accept("eastern6")
                        self.nextListTy(form: "eastern6")
                    }
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
    private func nextListTy(form type: String) {
        switch type {
        case "eastern1":
            break
        case "eastern2":
            listView.listView1.bgView.backgroundColor = UIColor.init(cssStr: "#C0FBE7")
            break
        case "eastern3":
            listView.listView1.bgView.backgroundColor = UIColor.init(cssStr: "#C0FBE7")
            listView.listView2.bgView.backgroundColor = UIColor.init(cssStr: "#C0FBE7")
            break
        case "eastern4":
            listView.listView1.bgView.backgroundColor = UIColor.init(cssStr: "#C0FBE7")
            listView.listView2.bgView.backgroundColor = UIColor.init(cssStr: "#C0FBE7")
            listView.listView3.bgView.backgroundColor = UIColor.init(cssStr: "#C0FBE7")
            break
        case "eastern5":
            listView.listView1.bgView.backgroundColor = UIColor.init(cssStr: "#C0FBE7")
            listView.listView2.bgView.backgroundColor = UIColor.init(cssStr: "#C0FBE7")
            listView.listView3.bgView.backgroundColor = UIColor.init(cssStr: "#C0FBE7")
            listView.listView4.bgView.backgroundColor = UIColor.init(cssStr: "#C0FBE7")
            break
        case "eastern6":
            listView.listView1.bgView.backgroundColor = UIColor.init(cssStr: "#C0FBE7")
            listView.listView2.bgView.backgroundColor = UIColor.init(cssStr: "#C0FBE7")
            listView.listView3.bgView.backgroundColor = UIColor.init(cssStr: "#C0FBE7")
            listView.listView4.bgView.backgroundColor = UIColor.init(cssStr: "#C0FBE7")
            listView.listView5.bgView.backgroundColor = UIColor.init(cssStr: "#C0FBE7")
            break
        default:
            break
        }
    }
    
}

