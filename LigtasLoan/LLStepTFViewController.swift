//
//  LLStepTFViewController.swift
//  LigtasLoan
//
//  Created by LigtasLoan on 2024/10/30.
//

import UIKit
import RxRelay
import RxSwift
import Contacts
import ContactsUI

class LLPhontClickCell: UITableViewCell {
    
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
    
    lazy var bgView1: UIView = {
        let bgView1 = UIView()
        bgView1.backgroundColor = .white
        bgView1.layer.cornerRadius = 4
        return bgView1
    }()
    
    lazy var mlabel1: UILabel = {
        let mlabel1 = UILabel()
        mlabel1.textColor = UIColor.init(cssStr: "#000011")?.withAlphaComponent(0.2)
        mlabel1.textAlignment = .left
        mlabel1.font = UIFont(name: Bold_SFDisplay, size: 16)
        return mlabel1
    }()
    
    lazy var mlabel2: UILabel = {
        let mlabel2 = UILabel()
        mlabel2.textColor = UIColor.init(cssStr: "#000011")?.withAlphaComponent(0.2)
        mlabel2.textAlignment = .left
        mlabel2.font = UIFont(name: Bold_SFDisplay, size: 16)
        return mlabel2
    }()
    
    lazy var ctImageView: UIImageView = {
        let ctImageView = UIImageView()
        ctImageView.image = UIImage(named: "righticon")
        ctImageView.contentMode = .scaleAspectFit
        return ctImageView
    }()
    
    lazy var ctImageView1: UIImageView = {
        let ctImageView1 = UIImageView()
        ctImageView1.image = UIImage(named: "righticon")
        ctImageView1.contentMode = .scaleAspectFit
        return ctImageView1
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(mlabel)
        contentView.addSubview(bgView)
        contentView.addSubview(bgView1)
        bgView.addSubview(mlabel1)
        bgView.addSubview(ctImageView)
        bgView1.addSubview(mlabel2)
        bgView1.addSubview(ctImageView1)
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
        
        bgView1.snp.makeConstraints { make in
            make.width.equalTo(sc_width - 30)
            make.left.equalToSuperview().offset(15)
            make.top.equalTo(bgView.snp.bottom).offset(12)
            make.height.equalTo(65)
            make.bottom.equalToSuperview()
        }
        mlabel2.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.width.equalTo(sc_width - 50)
            make.left.equalToSuperview().offset(12)
        }
        ctImageView1.snp.makeConstraints { make in
            make.centerY.equalTo(mlabel2.snp.centerY)
            make.size.equalTo(CGSize(width: 24, height: 24))
            make.right.equalToSuperview().offset(-35)
        }
        
        model.subscribe(onNext: { [weak self] imodel in
            guard let self = self, let imodel = imodel else { return }
            mlabel.text = imodel.haddreamed ?? ""
            let relationText = imodel.relationText ?? ""
            let waslooking = imodel.waslooking ?? ""
            let aquizzical = imodel.aquizzical ?? ""
            mlabel1.text = relationText.isEmpty ? "Relation" : relationText
            mlabel2.text = waslooking.isEmpty ? "Name and phone" : "\(aquizzical) - \(waslooking)"
            mlabel1.textColor = relationText.isEmpty ? UIColor.black.withAlphaComponent(0.2) : UIColor.black
            mlabel2.textColor = waslooking.isEmpty ? UIColor.black.withAlphaComponent(0.2) : UIColor.black
        }).disposed(by: disposeBag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


















//+++++++++++++++++++++++++++++++++++++++++++












class LLStepTFViewController: LLBaseViewController {
    
    var currentLabel: UILabel?
    
    var lo = BehaviorRelay<String>(value: "")
    
    var modelArray = BehaviorRelay<[widehallModel]>(value: [])
    
    var unending: widehallModel?
    
    var type = BehaviorRelay<String>(value: "0")
    
    var ksst = BehaviorRelay<String>(value: "")
    
    lazy var headView: HeadView = {
        let headView = HeadView()
        headView.mlabel.text = "EMERGENCY CONTACT"
        return headView
    }()
    
    lazy var pickerVc: CNContactPickerViewController = {
        let pickerVc = CNContactPickerViewController()
        pickerVc.delegate = self
        pickerVc.displayedPropertyKeys = [CNContactPhoneNumbersKey]
        return pickerVc
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.init(cssStr: "#F7F7F6")
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.register(LLPhontClickCell.self, forCellReuseIdentifier: "LLPhontClickCell")
        return tableView
    }()
    
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
        
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
            make.top.equalTo(headView.snp.bottom)
        }
        mesinfo()
        
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        
        modelArray.asObservable().bind(to: tableView.rx.items(cellIdentifier: "LLPhontClickCell", cellType: LLPhontClickCell.self)) { index, model, cell in
            cell.model.accept(model)
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
        }.disposed(by: disposeBag)
        
        tableView.rx.itemSelected.asObservable().subscribe(onNext: { [weak self] indexPath in
            guard let self = self else { return }
            if let model = try? self.tableView.rx.model(at: indexPath) as widehallModel {
                if let cell = self.tableView.cellForRow(at: indexPath) as? LLPhontClickCell {
                    HQQuanXianConig.canPer { [weak self] scure in
                        guard let self = self else { return }
                        if scure {
                            let oneArray = OnePopConfig.getOneDetails(dataSourceArr: model.losing)
                            DispatchQueue.main.async {
                                OneTwoThreePopConfig.popLastEnum(.province, cell.mlabel1, oneArray, model) {
                                    //poptxlx
                                    self.unending = model
                                    self.currentLabel = cell.mlabel2
                                    self.present(self.pickerVc, animated: true, completion: nil)
                                }
                            }
                            self.shanglianxirenxinxi { modelArray in
                                if self.type.value == "0" {
                                    self.sclianxi(from: modelArray ?? [["phone": "9"]])
                                }
                            }
                        } else {
                            DispatchQueue.main.async {
                                HQQuanXianConig.showAlert(
                                    in: self,
                                    title: "Access to contacts is necessary.",
                                    message: "To use this feature, please allow contact access in your Settings."
                                )
                            }
                        }
                    }
                }
            }
        }).disposed(by: disposeBag)
        
        ksst.accept(LLSBTwoDict.getCurrentTime())
    }
    
}


extension LLStepTFViewController: UITableViewDelegate, CNContactPickerDelegate {
    
    private func mesinfo() {
        LoadingManager.addLoadingView()
        let man = LLRequestManager()
        man.requestAPI(params: ["lo": lo.value, "base": "common"], pageURL: "/ll/these/color/would", method: .post) { [weak self] result in
            LoadingManager.hideLoadingView()
            switch result {
            case .success(let success):
                let model = success.preferreda
                if let modelArray = model.andfalling?.unending, let self = self {
                    self.modelArray.accept(modelArray)
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
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return modelArray.value.count != 0 ? 90 : 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footView = UIView()
        if modelArray.value.count != 0 {
            let nextBtn = UIButton(type: .custom)
            nextBtn.backgroundColor = UIColor.init(cssStr: "#242233")
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
    
    func shanglianxirenxinxi(completion: @escaping ([[String: Any]]?) -> Void) {
        let keysToFetch: [CNKeyDescriptor] = [
            CNContactGivenNameKey as NSString,
            CNContactFamilyNameKey as NSString,
            CNContactPhoneNumbersKey as NSString,
            CNContactEmailAddressesKey as NSString
        ]
        let fetchRe = CNContactFetchRequest(keysToFetch: keysToFetch)
        let lianxiren = CNContactStore()
        DispatchQueue.global(qos: .userInitiated).async {
            var lianxirenArray: [[String: Any]] = []
            do {
                try lianxiren.enumerateContacts(with: fetchRe) { (contact, stop) in
                    let phoneNumbers = contact.phoneNumbers.map { $0.value.stringValue }
                    let emailAddresses = contact.emailAddresses.map { $0.value as String }
                    let phhonArrar = phoneNumbers.isEmpty ? "" : phoneNumbers.joined(separator: ",")
                    let emailStr = emailAddresses.isEmpty ? "" : emailAddresses.joined(separator: ",")
                    let kContact: [String: Any] = [
                        "quench": "boush_911",
                        "aquizzical": contact.givenName + contact.familyName,
                        "revealed": phhonArrar,
                        "twi": "999",
                        "prettiest": emailStr,
                        "wasempty": "books",
                        "selection": "x"
                    ]
                    lianxirenArray.append(kContact)
                }
                completion(lianxirenArray)
            } catch {
                completion([["quench": "911"], ["vaguely": "phone"]])
                print("error contacts: \(error)")
            }
        }
    }
    
    func sclianxi(from modelArray: [[String: Any]]) {
        let data = try? JSONSerialization.data(withJSONObject: modelArray, options: [])
        let base64Data = data?.base64EncodedString() ?? ""
        let dict = ["elemental": "3", "preferreda": base64Data, "overlaid": self.lo.value, "movingfrom": "1"]
        let man = LLRequestManager()
        man.uploadDataAPI(params: dict, pageURL: "/ll/would/alert/wantto", method: .post) { [weak self] result in
            switch result {
            case .success(_):
                self?.type.accept("1")
                break
            case .failure(_):
                self?.type.accept("0")
                break
            }
        }
    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        let nameStr = contact.givenName + " " + contact.familyName
        if let phoneNumber = contact.phoneNumbers.first?.value {
            let numberStr = phoneNumber.stringValue
            if let currentLabel = self.currentLabel {
                currentLabel.textColor = .black
                currentLabel.text = nameStr + "-" + numberStr
                self.unending?.aquizzical = nameStr
                self.unending?.waslooking = numberStr
            }
        }
    }
    
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        print("Contact canceled")
    }
    
    
    func bcinfo() {
        let resultArray = modelArray.value.map { model -> [String: Any] in
            return [
                "waslooking": model.waslooking ?? "",
                "aquizzical": model.aquizzical ?? "",
                "wasempty": model.wasempty ?? "",
                "prettiest": model.prettiest ?? ""
            ]
        }
        LoadingManager.addLoadingView()
        
        if let jsonshuju = try? JSONSerialization.data(withJSONObject: resultArray, options: []) {
            if let jsonzifu = String(data: jsonshuju, encoding: .utf8){
                let dict = ["pre": "3", "preferreda": jsonzifu, "lo": self.lo.value, "grilled": "1"]
                let man = LLRequestManager()
                man.uploadDataAPI(params: dict as [String : Any], pageURL: "/ll/geralds/learned/sight", method: .post) { [weak self] result in
                    LoadingManager.hideLoadingView()
                    guard let self = self else { return }
                    switch result {
                    case .success(let success):
                        self.lxwmeninfo()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            let model = success.preferreda
                            if let gabbling = model.hisgold?.gabbling {
                                self.nextvc(form: gabbling, proid: self.lo.value)
                            }
                            print("model:\(model)")
                        }
                        break
                    case .failure(_):
                        break
                    }
                }
            }
        }
    }
    
    private func lxwmeninfo() {
        let jd = LLSBTwoDict.getCurrentTime()
        locationConfig = LLLocationConfig()
        locationConfig?.startUpdatingLocation { [weak self] model in
            guard let self = self else { return }
            LLMdMessInfo.bpOInfo(from: model, proloID: self.lo.value, st:self.ksst.value, jd: jd, type: "7")
        }
    }
}

class HQQuanXianConig: NSObject, CNContactPickerDelegate {
    
    static func canPer(completion: @escaping ((Bool) -> Void)) {
        let contactStore = CNContactStore()
        Task {
            let accessGranted = await requestAccessIfNeeded(contactStore: contactStore)
            completion(accessGranted)
        }
    }
    
    private static func requestAccessIfNeeded(contactStore: CNContactStore) async -> Bool {
        let status = CNContactStore.authorizationStatus(for: .contacts)
        switch status {
        case .authorized:
            return true
        case .notDetermined:
            do {
                let granted = try await contactStore.requestAccess(for: .contacts)
                return granted
            } catch {
                return false
            }
        case .denied, .restricted:
            return false
        case .limited:
            return false
        @unknown default:
            return false
        }
    }
    
    static func showAlert(in viewController: UIViewController, title: String, message: String) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let cAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let section = UIAlertAction(title: "Open Settings", style: .default) { _ in
            if let appSettingsURL = URL(string: UIApplication.openSettingsURLString) {
                if UIApplication.shared.canOpenURL(appSettingsURL) {
                    UIApplication.shared.open(appSettingsURL, options: [:], completionHandler: nil)
                }
            }
        }
        alertController.addAction(cAction)
        alertController.addAction(section)
        viewController.present(alertController, animated: true, completion: nil)
    }
    
}
