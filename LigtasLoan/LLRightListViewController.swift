//
//  LLSetingViewController.swift
//  LigtasLoan
//
//  Created by LigtasLoan on 2024/11/4.
//

import UIKit
import JXSegmentedView
import TYAlertController
import MJRefresh
import RxRelay
import RxSwift

class LLSetingViewController: LLBaseViewController {
    
    lazy var itemView1: LLRightItemView = {
        let itemView1 = LLRightItemView()
        itemView1.mlabel.text = "BORROWING CONTRACT"
        itemView1.bgView.backgroundColor = .white
        return itemView1
    }()
    
    lazy var itemView2: LLRightItemView = {
        let itemView2 = LLRightItemView()
        itemView2.mlabel.text = "PRIVACY STATEMENT"
        itemView2.bgView.backgroundColor = .white
        return itemView2
    }()
    
    lazy var itemView3: LLRightItemView = {
        let itemView3 = LLRightItemView()
        itemView3.mlabel.text = "CHECK FOR UPDATES"
        itemView3.bgView.backgroundColor = .white
        return itemView3
    }()

    lazy var headView: HeadView = {
        let headView = HeadView()
        headView.mlabel.text = "SETTINGS"
        return headView
    }()
    
    lazy var nextBtn: UIButton = {
        let nextBtn = UIButton(type: .custom)
        nextBtn.layer.cornerRadius = 4
        nextBtn.backgroundColor = UIColor.white
        nextBtn.setTitleColor(UIColor.init(cssStr: "#E1524C"), for: .normal)
        nextBtn.setTitle("REMOVING OR CANCELLING AN ACCOUNT", for: .normal)
        nextBtn.titleLabel?.font = UIFont(name: Bold_SFDisplay, size: 15)
        return nextBtn
    }()
    
    lazy var delView: DelView = {
        let delView = DelView(frame: UIScreen.main.bounds)
        return delView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.init(cssStr: "#F6F7F6")
        
        view.addSubview(headView)
        headView.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(StatusBarHelper.getStatusBarHeight() + 56)
        }
        headView.backBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.navigationController?.popViewController(animated: true)
        }).disposed(by: disposeBag)
        
        view.addSubview(itemView1)
        view.addSubview(itemView2)
        view.addSubview(itemView3)
        view.addSubview(nextBtn)
        
        itemView1.snp.makeConstraints { make in
            make.top.equalTo(headView.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(48)
        }
        itemView2.snp.makeConstraints { make in
            make.top.equalTo(itemView1.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(48)
        }
        itemView3.snp.makeConstraints { make in
            make.top.equalTo(itemView2.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(48)
        }
        
        nextBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-30)
            make.height.equalTo(48)
        }
        
        itemView1.btn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            let webvc = LLWYViewController()
            webvc.pageUrl.accept("\(h5_URL)/AgaranPesoPrivacyPolicy")
            self.navigationController?.pushViewController(webvc, animated: true)
        }).disposed(by: disposeBag)
        
        itemView2.btn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            let webvc = LLWYViewController()
            webvc.pageUrl.accept("\(h5_URL)/AgaranPesoLoanTerm")
            self.navigationController?.pushViewController(webvc, animated: true)
        }).disposed(by: disposeBag)
        
        itemView3.btn.rx.tap.subscribe(onNext: {
            LoadingManager.addLoadingView()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                LoadingManager.hideLoadingView()
                ToastViewConfig.showToast(message: "Current version is already the latest.")
            }
        }).disposed(by: disposeBag)
        
        nextBtn.rx.tap.subscribe(onNext: { [weak self] in
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
    
}




//++++++++++++++++++++++++++++++++++++++++++++





class LLAllDianViewController: LLBaseViewController {
    
    private var segmurce: JXSegmentedTitleDataSource!
    
    private var blatantly = BehaviorRelay<String>(value: "")
    
    private lazy var headView: HeadView = createHeadView()
    private lazy var segmentedView: JXSegmentedView = createSegmentedView()
    private lazy var cocsciew: UIScrollView = createCocsciew()
    
    private var listVCArray = [LLListDianViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewControllers()
        setupBindings()
    }
    
    private func setupUI() {
        view.addSubview(headView)
        view.addSubview(segmentedView)
        view.addSubview(cocsciew)
        
        setupHeadViewConstraints()
        setupSegmentedViewConstraints()
        setupCocsciewConstraints()
    }
    
    private func setupHeadViewConstraints() {
        headView.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(StatusBarHelper.getStatusBarHeight() + 56)
        }
    }
    
    private func setupSegmentedViewConstraints() {
        segmentedView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(headView.snp.bottom)
            make.height.equalTo(40)
        }
    }
    
    private func setupCocsciewConstraints() {
        cocsciew.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(segmentedView.snp.bottom)
        }
    }
    
    private func setupViewControllers() {
        // Remove old view controllers
        listVCArray.forEach { $0.view.removeFromSuperview() }
        listVCArray.removeAll()
        
        for _ in 0..<5 {
            let vc = LLListDianViewController()
            cocsciew.addSubview(vc.view)
            listVCArray.append(vc)
            
            vc.listView.tableView.rx.modelSelected(widehallModel.self)
                .subscribe(onNext: { [weak self] model in
                    self?.handleModelSelection(model)
                })
                .disposed(by: disposeBag)
        }
        
        updateViewControllersLayout()
        segmentedView(segmentedView, didSelectedItemAt: 0)
    }
    
    private func updateViewControllersLayout() {
        for (index, vc) in listVCArray.enumerated() {
            vc.view.frame = CGRect(x: sc_width * CGFloat(index), y: 0, width: sc_width, height: sc_height - segmentedView.frame.maxY)
        }
    }
    
    private func handleModelSelection(_ model: widehallModel) {
        LoadingManager.addLoadingView()
        print("Selected model: \(model.rejoining?.gazed ?? "")")
        genjuurltovc(from: model.rejoining?.gazed ?? "")
    }
    
    private func setupBindings() {
        headView.backBtn.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.navigationController?.popViewController(animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    private func createHeadView() -> HeadView {
        let headView = HeadView()
        headView.mlabel.text = "ORDER"
        return headView
    }
    
    private func createSegmentedView() -> JXSegmentedView {
        let segmentedView = JXSegmentedView()
        segmentedView.delegate = self
        segmentedView.backgroundColor = .white
        
        segmurce = JXSegmentedTitleDataSource()
        segmurce.titles = ["All", "Pending Repayment", "Payment Failure", "Completed", "In Progress"]
        segmurce.isTitleColorGradientEnabled = true
        segmurce.titleSelectedFont = UIFont(name: Bold_SFDisplay, size: 15)!
        segmurce.titleNormalFont = UIFont(name: Bold_SFDisplay, size: 15)!
        segmurce.titleNormalColor = UIColor.black.withAlphaComponent(0.5)
        segmurce.titleSelectedColor = UIColor.black
        
        segmentedView.dataSource = segmurce
        let indicator = createSegmentedIndicator()
        segmentedView.indicators = [indicator]
        segmentedView.contentScrollView = cocsciew
        
        return segmentedView
    }
    
    private func createSegmentedIndicator() -> JXSegmentedIndicatorLineView {
        let indicator = JXSegmentedIndicatorLineView()
        indicator.indicatorWidth = JXSegmentedViewAutomaticDimension
        indicator.indicatorHeight = 2
        indicator.lineStyle = .lengthen
        indicator.indicatorColor = UIColor(cssStr: "#1EFB91")?.withAlphaComponent(0.8) ?? UIColor.black
        return indicator
    }
    
    private func createCocsciew() -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor(cssStr: "#F6F7F6")
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentSize = CGSize(width: sc_width * 5, height: 0)
        return scrollView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateViewControllersLayout()
    }
}


extension LLAllDianViewController: JXSegmentedViewDelegate {
    
    func segmentedView(_ segmentedView: JXSegmentedView, didSelectedItemAt index: Int) {
        switch index {
        case 0:
            blatantly.accept("4")
            break
        case 1:
            blatantly.accept("6")
            break
        case 2:
            blatantly.accept("8")
            break
        case 3:
            blatantly.accept("5")
            break
        case 4:
            blatantly.accept("7")
            break
        default:
            break
        }
        self.listVCArray[index].blatantly.accept(blatantly.value)
        self.listVCArray[index].xdata(from: blatantly.value)
    }
    
}





class LLListDianViewController: LLBaseViewController {
    
    var block: ((String) -> Void)?
    
    var blatantly = BehaviorRelay<String>(value: "")
    
    lazy var listView: LLOrderListView = {
        let listView = LLOrderListView()
        return listView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(listView)
        listView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        listView.tableView.mj_header =  MJRefreshNormalHeader(refreshingBlock: { [weak self] in
            guard let self = self else { return }
            self.xdata(from: blatantly.value)
        })
        
    }
    
}

extension LLListDianViewController {
    
     func xdata(from blatantly: String) {
        LoadingManager.addLoadingView()
        let man = LLRequestManager()
         man.requestAPI(params: ["olist": "1", "blatantly": blatantly, "date": LLSBTwoDict.getCurrentTime()], pageURL: "/ll/bedchamber/because/tells", method: .post) { result in
            LoadingManager.hideLoadingView()
            self.listView.tableView.mj_header?.endRefreshing()
            switch result {
            case .success(let success):
                let model = success.preferreda
                if let moelArray = model.unending, moelArray.count != 0 {
                    self.emptyView.removeFromSuperview()
                    self.listView.modelArray.accept(moelArray)
                }else {
                    self.listView.tableView.addSubview(self.emptyView)
                    self.emptyView.snp.makeConstraints { make in
                        make.centerY.equalToSuperview()
                        make.left.equalToSuperview().offset((sc_width - 211) * 0.5)
                        make.size.equalTo(CGSize(width: 211, height: 208))
                    }
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
}






class LLOrderListView: UIView {
    
    let disposeBag = DisposeBag()
    
    var modelArray = BehaviorRelay<[widehallModel]>(value: [])
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.init(cssStr: "#F6F7F6")
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.register(LLOrderListCell.self, forCellReuseIdentifier: "LLOrderListCell")
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        
        modelArray.asObservable().bind(to: tableView.rx.items(cellIdentifier: "LLOrderListCell", cellType: LLOrderListCell.self)) { index, model, cell in
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            cell.model.accept(model)
        }.disposed(by: disposeBag)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension LLOrderListView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
}


class LLemptyView: UIView {
    
    lazy var bgImageView: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "EMPTUYIM")
        return bgImageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgImageView)
        bgImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 211, height: 208))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class LLOrderListCell: UITableViewCell {
    
    let disposeBag = DisposeBag()
    
    var model = BehaviorRelay<widehallModel?>(value: nil)
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .white
        bgView.layer.cornerRadius = 4
        return bgView
    }()
    
    lazy var ctImageView: UIImageView = {
        let ctImageView = UIImageView()
        return ctImageView
    }()
    
    lazy var mlabel: UILabel = {
        let mlabel = UILabel()
        mlabel.textColor = UIColor.black.withAlphaComponent(0.5)
        mlabel.textAlignment = .left
        mlabel.font = UIFont(name: Bold_SFDisplay, size: 15)
        return mlabel
    }()
    
    lazy var tlabel: PaddedLabel = {
        let tlabel = PaddedLabel()
        tlabel.textColor = .black
        tlabel.textAlignment = .center
        tlabel.font = UIFont(name: Bold_SFDisplay, size: 15)
        tlabel.padding = UIEdgeInsets(top: 3, left: 10, bottom: 3, right: 10)
        tlabel.backgroundColor = UIColor.init(cssStr: "#1EDB91")
        return tlabel
    }()
    
    lazy var item1: OListItemView = {
        let item1 = OListItemView()
        item1.bgView.backgroundColor = UIColor.init(cssStr: "#1EDB91")
        return item1
    }()
    
    lazy var item2: OListItemView = {
        let item2 = OListItemView()
        item2.bgView.backgroundColor = UIColor.init(cssStr: "#55E7FE")
        return item2
    }()
    
    lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor.init(cssStr: "#F5F5F3")
        return lineView
    }()
    
    lazy var desclabel: UILabel = {
        let desclabel = UILabel()
        desclabel.textColor = UIColor.black.withAlphaComponent(0.5)
        desclabel.textAlignment = .left
        desclabel.font = UIFont(name: Bold_SFDisplay, size: 15)
        return desclabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(bgView)
        bgView.addSubview(ctImageView)
        bgView.addSubview(mlabel)
        bgView.addSubview(tlabel)
        bgView.addSubview(item1)
        bgView.addSubview(item2)
        bgView.addSubview(lineView)
        bgView.addSubview(desclabel)
        bgView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(24)
            make.bottom.equalToSuperview()
        }
        
        ctImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(10)
            make.size.equalTo(CGSize(width: 80, height: 80))
        }
        
        mlabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14)
            make.left.equalTo(ctImageView.snp.right).offset(14)
            make.height.equalTo(17)
            make.bottom.equalToSuperview().offset(-100)
        }
        tlabel.snp.makeConstraints { make in
            make.height.equalTo(21)
            make.right.equalToSuperview().offset(-12)
            make.top.equalToSuperview().offset(12)
        }
        item1.snp.makeConstraints { make in
            make.left.equalTo(ctImageView.snp.right).offset(13)
            make.size.equalTo(CGSize(width: 115, height: 45))
            make.top.equalTo(tlabel.snp.bottom).offset(12)
        }
        item2.snp.makeConstraints { make in
            make.left.equalTo(item1.snp.right)
            make.size.equalTo(CGSize(width: 115, height: 45))
            make.top.equalTo(tlabel.snp.bottom).offset(12)
        }
        lineView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(10)
            make.height.equalTo(0.5)
            make.top.equalTo(item2.snp.bottom).offset(8)
        }
        desclabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.top.equalTo(lineView.snp.top)
            make.left.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
        }
        model.asObservable().subscribe(onNext: { [weak self] model in
            guard let self = self, let model = model else { return }
            ctImageView.kf.setImage(with: URL(string: model.rejoining?.makeyou ?? ""))
            mlabel.text = model.blot ?? ""
            tlabel.text = model.rejoining?.shareday ?? ""
            item1.mlabel.text = model.herseat ?? ""
            item1.m1label.text = model.tiredly ?? ""
            item2.mlabel.text = model.rejoining?.followday ?? ""
            item2.m1label.text = model.rejoining?.distinctionday ?? ""
            desclabel.text = model.belonging ?? ""
        }).disposed(by: disposeBag)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class OListItemView: UIView {
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        return bgView
    }()
    
    lazy var mlabel: UILabel = {
        let mlabel = UILabel()
        mlabel.textColor = UIColor.black.withAlphaComponent(0.5)
        mlabel.textAlignment = .center
        mlabel.font = UIFont(name: Regular_SFDisplay, size: 12)
        return mlabel
    }()
    
    lazy var m1label: UILabel = {
        let m1label = UILabel()
        m1label.textColor = .black
        m1label.textAlignment = .center
        m1label.font = UIFont(name: Bold_SFDisplay, size: 12)
        return m1label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        bgView.addSubview(mlabel)
        bgView.addSubview(m1label)
        bgView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        mlabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(5)
            make.height.equalTo(17)
        }
        m1label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(mlabel.snp.bottom).offset(3)
            make.height.equalTo(17)
            make.bottom.equalToSuperview().offset(-3)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
