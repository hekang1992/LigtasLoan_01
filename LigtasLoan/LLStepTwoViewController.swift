//
//  LLStepTwoViewController.swift
//  LigtasLoan
//
//  Created by LigtasLoan on 2024/10/27.
//

import UIKit
import RxSwift
import RxRelay

class LLInputCell: UITableViewCell {
    
    let disposeBag = DisposeBag()
    
    var model = BehaviorRelay<widehallModel?>(value: nil)
    
    lazy var mlabel: UILabel = {
        let mlabel = UILabel()
        mlabel.textColor = .black
        mlabel.textAlignment = .left
        mlabel.font = UIFont(name: Bold_SFDisplay, size: 16)
        return mlabel
    }()
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .white
        bgView.layer.cornerRadius = 4
        return bgView
    }()
    
    lazy var inputtx: UITextField = {
        let inputtx = UITextField()
        inputtx.font = UIFont(name: Bold_SFDisplay, size: 16)
        inputtx.textColor = .black
        return inputtx
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(mlabel)
        contentView.addSubview(bgView)
        bgView.addSubview(inputtx)
        
        mlabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(20)
        }
        bgView.snp.makeConstraints { make in
            make.width.equalTo(sc_width - 30)
            make.left.equalToSuperview().offset(15)
            make.top.equalTo(mlabel.snp.bottom).offset(8)
            make.height.equalTo(65)
            make.bottom.equalToSuperview()
        }
        inputtx.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.width.equalTo(sc_width - 50)
            make.left.equalToSuperview().offset(12)
        }
        
        model.subscribe(onNext: { [weak self] imodel in
            guard let self = self, let imodel = imodel else { return }
            mlabel.text = imodel.hatred ?? ""
            let butshe = imodel.butshe ?? ""
            inputtx.placeholder = imodel.throwingher ?? ""
            inputtx.text = !butshe.isEmpty ? butshe : ""

            if imodel.risked == "1" {
                inputtx.keyboardType = .numberPad
            }else {
                inputtx.keyboardType = .default
            }
            
        }).disposed(by: disposeBag)
        
        inputtx.rx.text.orEmpty.bind(onNext: { [weak self] text in
            guard let self = self else { return }
            if let model = self.model.value {
                model.butshe = text
            }else {
                model.value?.butshe = text
            }
        }).disposed(by: disposeBag)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class LLBtnClickCell: UITableViewCell {
    
    let disposeBag = DisposeBag()
    
    var model = BehaviorRelay<widehallModel?>(value: nil)
    
    lazy var mlabel: UILabel = {
        let mlabel = UILabel()
        mlabel.textColor = .black
        mlabel.textAlignment = .left
        mlabel.font = UIFont(name: Bold_SFDisplay, size: 16)
        return mlabel
    }()
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .white
        bgView.layer.cornerRadius = 4
        return bgView
    }()
    
    lazy var mlabel1: UILabel = {
        let mlabel1 = UILabel()
        mlabel1.textColor = UIColor.black.withAlphaComponent(0.2)
        mlabel1.textAlignment = .left
        mlabel1.font = UIFont(name: Bold_SFDisplay, size: 16)
        return mlabel1
    }()
    
    lazy var ctImageView: UIImageView = {
        let ctImageView = UIImageView()
        ctImageView.image = UIImage(named: "righticon")
        ctImageView.contentMode = .scaleAspectFit
        return ctImageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(mlabel)
        contentView.addSubview(bgView)
        bgView.addSubview(mlabel1)
        bgView.addSubview(ctImageView)
        mlabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(20)
        }
        bgView.snp.makeConstraints { make in
            make.width.equalTo(sc_width - 30)
            make.left.equalToSuperview().offset(15)
            make.top.equalTo(mlabel.snp.bottom).offset(8)
            make.height.equalTo(65)
            make.bottom.equalToSuperview()
        }
        mlabel1.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.width.equalTo(sc_width - 50)
            make.left.equalToSuperview().offset(12)
        }
        ctImageView.snp.makeConstraints { make in
            make.centerY.equalTo(mlabel1.snp.centerY)
            make.size.equalTo(CGSize(width: 24, height: 24))
            make.right.equalToSuperview().offset(-35)
        }
        
        model.subscribe(onNext: { [weak self] imodel in
            guard let self = self, let imodel = imodel else { return }
            mlabel.text = imodel.hatred ?? ""
            let butshe = imodel.butshe ?? ""
            mlabel1.text = !butshe.isEmpty ? butshe : imodel.throwingher ?? ""
            mlabel1.textColor = !butshe.isEmpty ? UIColor.black : UIColor.black.withAlphaComponent(0.2)
        }).disposed(by: disposeBag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}






















//+++++++++++++++++++++++++++++++++++++++++++++++++++









class LLStepTwoViewController: LLBaseViewController {
    
    var lo = BehaviorRelay<String>(value: "")
    
    var modelArray = BehaviorRelay<[widehallModel]>(value: [])
    
    lazy var headView: HeadView = {
        let headView = HeadView()
        headView.mlabel.text = "PERSONAL INFORMATION"
        return headView
    }()
    
    var ksst = BehaviorRelay<String>(value: "")
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.init(cssStr: "#F7F7F6")
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.register(LLInputCell.self, forCellReuseIdentifier: "LLInputCell")
        tableView.register(LLBtnClickCell.self, forCellReuseIdentifier: "LLBtnClickCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ksst.accept(LLSBTwoDict.getCurrentTime())
        
        view.addSubview(headView)
        headView.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(StatusBarHelper.getStatusBarHeight() + 56)
        }
        
        headView.backBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.pushlistvc()
        }).disposed(by: disposeBag)
        
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
            make.top.equalTo(headView.snp.bottom)
        }
        
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        
        mesinfo()
        
        modelArray.asObservable().bind(to: tableView.rx.items) { [weak self] tableView, index, model in
            guard let self = self else { return UITableViewCell()}
            let underthe = model.underthe ?? ""
            if underthe == "story2" {
                if let cell = tableView.dequeueReusableCell(withIdentifier: "LLInputCell", for: IndexPath(row: index, section: 0)) as? LLInputCell  {
                    cell.backgroundColor = .clear
                    cell.selectionStyle = .none
                    cell.model.accept(model)
                    return cell
                }
            }else {
                if let cell = tableView.dequeueReusableCell(withIdentifier: "LLBtnClickCell", for: IndexPath(row: index, section: 0)) as? LLBtnClickCell  {
                    cell.backgroundColor = .clear
                    cell.selectionStyle = .none
                    cell.model.accept(model)
                    return cell
                }
            }
            return UITableViewCell()
        }.disposed(by: disposeBag)
        
        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                guard let self = self else { return }
                self.view.endEditing(true)
                
                let model = self.modelArray.value[indexPath.row]
                guard let cell = tableView.cellForRow(at: indexPath) as? LLBtnClickCell else { return }
                self.handleStorySelection(model, cell: cell)
            })
            .disposed(by: disposeBag)
        
    }
    
}

extension LLStepTwoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return modelArray.value.count != 0 ? 90 : 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footView = UIView()
        if modelArray.value.count != 0 {
            let nextBtn = UIButton(type: .custom)
            nextBtn.backgroundColor = UIColor.init(cssStr: "#222233")
            nextBtn.setTitle("SUBMIT", for: .normal)
            nextBtn.setTitleColor(UIColor.init(cssStr: "#1EFB90"), for: .normal)
            nextBtn.titleLabel?.font = UIFont(name: Bold_SFDisplay, size: 18)
            footView.addSubview(nextBtn)
            nextBtn.snp.makeConstraints { make in
                make.bottom.equalToSuperview()
                make.centerX.equalToSuperview()
                make.left.equalToSuperview().offset(12)
                make.height.equalTo(56)
            }
            nextBtn.rx.tap.subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                self.bcinfo()
            }).disposed(by: disposeBag)
        }
        return footView
    }
    
    private func mesinfo() {
        LoadingManager.addLoadingView()
        let man = LLRequestManager()
        man.requestAPI(params: ["lo": lo.value], pageURL: "/ll/would/sitting/everyone", method: .post) { [weak self] result in
            LoadingManager.hideLoadingView()
            switch result {
            case .success(let success):
                let model = success.preferreda
                if let modelArray = model.widehall, let self = self {
                    self.modelArray.accept(modelArray)
                }
                break
            case .failure(_):
                break
            }
        }
        
    }
    
    private func bcinfo() {
        var dict: [String: Any]?
        dict = modelArray.value.reduce(into: [String: Any](), { preesult, model in
            guard let key = model.andmammy else { return }
            let value: Any
            if model.underthe == "story1" || model.underthe == "story4" {
                value = model.elemental ?? ""
            } else {
                value = model.butshe ?? ""
            }
            preesult[key] = value
        })
        dict?["eat"] = "apple"
        dict?["lo"] = lo.value
        dict?["bidding"] = "1"
        dict?["shining"] = "bur"
        LoadingManager.addLoadingView()
        let man = LLRequestManager()
        man.requestAPI(params: dict, pageURL: "/ll/yankees/tongue/groupof", method: .post) { [weak self] result in
            LoadingManager.hideLoadingView()
            guard let self = self else { return }
            switch result {
            case .success(let success):
                let gabbling = success.preferreda.hisgold?.gabbling ?? ""
                self.mmonfi()
                self.nextvc(form: gabbling, proid: lo.value)
                break
            case .failure(_):
                break
            }
        }
    }
    
    private func mmonfi() {
        let jd = LLSBTwoDict.getCurrentTime()
        locationConfig = LLLocationConfig()
        locationConfig?.startUpdatingLocation { [weak self] model in
            guard let self = self else { return }
            LLMdMessInfo.bpOInfo(from: model, proloID: self.lo.value, st:self.ksst.value, jd: jd, type: "5")
        }
    }
    
}
