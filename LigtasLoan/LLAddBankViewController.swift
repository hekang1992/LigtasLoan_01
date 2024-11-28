//
//  LLAddBankViewController.swift
//  LigtasLoan
//
//  Created by LigtasLoan on 2024/11/12.
//

import UIKit
import RxRelay
import RxSwift

class SelBaViewCell: UITableViewCell {
    
    var model = BehaviorRelay<aviolenceModel?>(value: nil)
    
    let disposeBag = DisposeBag()
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .white
        bgView.layer.cornerRadius = 4
        return bgView
    }()
    
    lazy var mlabel: UILabel = {
        let mlabel = UILabel()
        mlabel.textColor = UIColor.init(cssStr: "#000011")
        mlabel.textAlignment = .left
        mlabel.font = UIFont(name: Bold_SFDisplay, size: 16)
        return mlabel
    }()
    
    lazy var nlabel: UILabel = {
        let nlabel = UILabel()
        nlabel.textColor = UIColor.init(cssStr: "#000011")?.withAlphaComponent(0.5)
        nlabel.textAlignment = .left
        nlabel.font = UIFont(name: Bold_SFDisplay, size: 16)
        return nlabel
    }()
    
    lazy var ctImageView: UIImageView = {
        let ctImageView = UIImageView()
        ctImageView.isHidden = true
        ctImageView.image = UIImage(named: "Vector")
        return ctImageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(bgView)
        bgView.addSubview(mlabel)
        bgView.addSubview(nlabel)
        bgView.addSubview(ctImageView)
        bgView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(21)
            make.top.equalToSuperview().offset(24)
            make.height.equalTo(65)
            make.bottom.equalToSuperview()
        }
        mlabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(12)
            make.top.equalToSuperview().offset(11)
            make.height.equalTo(20)
        }
        nlabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(12)
            make.top.equalTo(mlabel.snp.bottom).offset(6)
            make.height.equalTo(20)
            make.bottom.equalToSuperview().offset(-10)
        }
        ctImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 15, height: 18))
            make.right.equalToSuperview().offset(-21)
        }
        
        model.subscribe(onNext: { [weak self] modl in
            guard let self = self, let model = modl else { return }
            mlabel.text = model.crumbs
            nlabel.text = model.outunder
        }).disposed(by: disposeBag)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}









class LLAddBankViewController: LLBaseViewController {
    
    var index: Int = 0
    
    var numArray = BehaviorRelay<[String]?>(value: [])
    
    var modelArray = BehaviorRelay<[aviolenceModel]>(value: [])
    var wallArray = BehaviorRelay<[aviolenceModel]>(value: [])
    var bankArray = BehaviorRelay<[aviolenceModel]>(value: [])
    
    var selModel = BehaviorRelay<aviolenceModel?>(value: nil)
    
    lazy var headView: HeadView = {
        let headView = HeadView()
        headView.mlabel.text = "CHANGE ACCOUNT"
        headView.addBtn.isHidden = false
        return headView
    }()
    
    lazy var btnView: LLQAWView = {
        let btnView = LLQAWView()
        btnView.backgroundColor = .white
        return btnView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.init(cssStr: "#F7F7F6")
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.register(SelBaViewCell.self, forCellReuseIdentifier: "SelBaViewCell")
        return tableView
    }()
    
    lazy var nextBtn: UIButton = {
        let nextBtn = UIButton(type: .custom)
        nextBtn.backgroundColor = UIColor.init(cssStr: "#B7B7D5")
        nextBtn.setTitle("CONFIRM", for: .normal)
        nextBtn.isEnabled = false
        nextBtn.setTitleColor(UIColor.init(cssStr: "#1EFB96"), for: .normal)
        nextBtn.titleLabel?.font = UIFont(name: Bold_SFDisplay, size: 18)
        return nextBtn
    }()
    
    var selCell: SelBaViewCell?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(headView)
        headView.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(StatusBarHelper.getStatusBarHeight() + 56)
        }
        
        headView.backBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.pushlistvc()
        }).disposed(by: disposeBag)
        
        view.addSubview(btnView)
        btnView.snp.makeConstraints { make in
            make.top.equalTo(headView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(35)
        }
        
        view.addSubview(nextBtn)
        nextBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-30)
            make.height.equalTo(56)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalTo(nextBtn.snp.top).offset(-5)
            make.top.equalTo(btnView.snp.bottom)
        }
        
        btnView.eBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            btnView.eBtn.setImage(UIImage(named: "wall_sel"), for: .normal)
            btnView.bBtn.setImage(UIImage(named: "Bank"), for: .normal)
            self.modelArray.accept(self.wallArray.value)
            self.index = 0
        }).disposed(by: disposeBag)
        
        btnView.bBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.index = 1
            btnView.eBtn.setImage(UIImage(named: "E-Wallet"), for: .normal)
            btnView.bBtn.setImage(UIImage(named: "bank_sel"), for: .normal)
            self.modelArray.accept(self.bankArray.value)
        }).disposed(by: disposeBag)
        
        headView.addBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            let listVc = LLQAWViewController()
            listVc.numArray.accept(self.numArray.value)
            self.navigationController?.pushViewController(listVc, animated: true)
        }).disposed(by: disposeBag)
        
        hqbaInfo()
        
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        
        modelArray.asObservable().bind(to: tableView.rx.items(cellIdentifier: "SelBaViewCell", cellType: SelBaViewCell.self)) { index, model, cell in
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            cell.model.accept(model)
        }.disposed(by: disposeBag)
        
        self.modelArray.subscribe(onNext: { [weak self] modelArray in
            guard let self = self else { return  }
            if modelArray.count != 0 {
                self.emptyView.removeFromSuperview()
            }else {
                self.tableView.addSubview(self.emptyView)
                self.emptyView.snp.makeConstraints { make in
                    make.centerY.equalToSuperview()
                    make.left.equalToSuperview().offset((sc_width - 211) * 0.5)
                    make.size.equalTo(CGSize(width: 211, height: 208))
                }
            }
        }).disposed(by: disposeBag)
        
        tableView.rx.itemSelected.subscribe(onNext: { [weak self] indexPath in
            if let cell = self?.tableView.cellForRow(at: indexPath) as? SelBaViewCell, let model = self?.modelArray.value[indexPath.row] {
                self?.selCell?.ctImageView.isHidden = true
                cell.ctImageView.isHidden = false
                self?.nextBtn.isEnabled = true
                self?.nextBtn.backgroundColor = UIColor.init(cssStr: "#222233")
                self?.selModel.accept(model)
                self?.selCell = cell
            }
        }).disposed(by: disposeBag)
        
        self.nextBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self, let model = self.selModel.value else { return }
            self.changeAcc(form: model)
        }).disposed(by: disposeBag)
        
    }
}

extension LLAddBankViewController: UITableViewDelegate {
    
    private func changeAcc(form model: aviolenceModel) {
        LoadingManager.addLoadingView()
        let modelArray = self.numArray.value
        let dict = ["exchange": model.exchange ?? "", "finally": modelArray?[1] ?? "0", "lo": modelArray?[0] ?? "0"]
        let man = LLRequestManager()
        man.requestAPI(params: dict, pageURL: "/ll/itwas/springs/mother", method: .post) { [weak self] result in
            guard let self = self else { return }
            LoadingManager.hideLoadingView()
            switch result {
            case .success(let success):
                let model = success.preferreda
                if let faultif = model.faultif {
                    genjuurltovc(from: faultif)
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
    private func hqbaInfo() {
        LoadingManager.addLoadingView()
        let man = LLRequestManager()
        man.requestAPI(params: ["info": "1"], pageURL: "/ll/shouting/small/about", method: .post) { [weak self] result in
            LoadingManager.hideLoadingView()
            switch result {
            case .success(let success):
                let model = success.preferreda
                if let modelArray = model.unending {
                    modelArray.forEach {
                        if $0.hearth == 1 {
                            self?.wallArray.accept($0.aviolence ?? [])
                            self?.modelArray.accept(self?.wallArray.value ?? [])
                        }else {
                            self?.bankArray.accept($0.aviolence ?? [])
                        }
                    }
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
}
