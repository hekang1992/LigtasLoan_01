//
//  HomeView.swift
//  LigtasLoan
//
//  Created by LigtasLoan on 2024/10/25.
//

import RxSwift
import TYCyclePagerView
import RxRelay

let sc_width = UIScreen.main.bounds.size.width
let sc_height = UIScreen.main.bounds.size.height

class OneView: UIView {
    
    lazy var bgImageView: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "llbasebg")
        return bgImageView
    }()
    
    lazy var ppImageView: UIImageView = {
        let ppImageView = UIImageView()
        ppImageView.image = UIImage(named: "bgimageapoi")
        return ppImageView
    }()
    
    lazy var scro: UIScrollView = {
        let scro = UIScrollView()
        scro.backgroundColor = .clear
        scro.showsHorizontalScrollIndicator = false
        scro.showsVerticalScrollIndicator = false
        scro.contentInsetAdjustmentBehavior = .never
        return scro
    }()
    
    lazy var wscro: UIScrollView = {
        let wscro = UIScrollView()
        wscro.backgroundColor = .clear
        wscro.showsHorizontalScrollIndicator = false
        wscro.showsVerticalScrollIndicator = false
        wscro.contentInsetAdjustmentBehavior = .never
        return wscro
    }()
    
    //
    lazy var ctImageView: UIImageView = {
        let ctImageView = UIImageView()
        ctImageView.image = UIImage(named: "homeonbg")
        ctImageView.isUserInteractionEnabled = true
        return ctImageView
    }()
    
    lazy var cinImageView: UIImageView = {
        let cinImageView = UIImageView()
        cinImageView.image = UIImage(named: "priimageloan")
        cinImageView.isUserInteractionEnabled = true
        return cinImageView
    }()
    
    lazy var mlabel: UILabel = {
        let mlabel = UILabel()
        mlabel.text = "Professional and compliant, with complete qualifications."
        mlabel.numberOfLines = 0
        mlabel.textColor = UIColor.init(cssStr: "#022005")
        mlabel.textAlignment = .left
        mlabel.font = UIFont(name: Bold_SFDisplay, size: 16)
        return mlabel
    }()
    
    lazy var priBtn: UIButton = {
        let priBtn = UIButton(type: .custom)
        priBtn.backgroundColor = UIColor.init(cssStr: "#B6FFD9")
        priBtn.setTitle("Privacy Policy", for: .normal)
        priBtn.setTitleColor(UIColor(cssStr: "#1EE26B"), for: .normal)
        priBtn.titleLabel?.font = UIFont(name: Bold_SFDisplay, size: 15)
        priBtn.layer.cornerRadius = 10
        return priBtn
    }()
    
    lazy var loanBtn: UIButton = {
        let loanBtn = UIButton(type: .custom)
        loanBtn.backgroundColor = UIColor.init(cssStr: "#B6FFD9")
        loanBtn.setTitle("Loan Terms", for: .normal)
        loanBtn.setTitleColor(UIColor(cssStr: "#1EE26B"), for: .normal)
        loanBtn.titleLabel?.font = UIFont(name: Bold_SFDisplay, size: 15)
        loanBtn.layer.cornerRadius = 10
        return loanBtn
    }()
    
    lazy var queeyImageView: UIImageView = {
        let queeyImageView = UIImageView()
        queeyImageView.image = UIImage(named: "priimageloan")
        queeyImageView.isUserInteractionEnabled = true
        return queeyImageView
    }()
    
    lazy var mnlabel: UILabel = {
        let mnlabel = UILabel()
        mnlabel.text = "May I ask about your satisfaction with the current loan amount and interest rate?"
        mnlabel.numberOfLines = 0
        mnlabel.textColor = UIColor.init(cssStr: "#022006")
        mnlabel.textAlignment = .left
        mnlabel.font = UIFont(name: Bold_SFDisplay, size: 16)
        return mnlabel
    }()
    
    lazy var traBtn: UIButton = {
        let traBtn = UIButton(type: .custom)
        traBtn.adjustsImageWhenHighlighted = false
        traBtn.setImage(UIImage(named: "Grouptraff"), for: .normal)
        return traBtn
    }()
    
    lazy var accountBtn: UIButton = {
        let accountBtn = UIButton(type: .custom)
        accountBtn.adjustsImageWhenHighlighted = false
        accountBtn.setImage(UIImage(named: "Groupaccount"), for: .normal)
        return accountBtn
    }()
    
    lazy var ballBtn: UIButton = {
        let ballBtn = UIButton(type: .custom)
        ballBtn.adjustsImageWhenHighlighted = false
        ballBtn.setImage(UIImage(named: "Groupallgro"), for: .normal)
        return ballBtn
    }()
    
    lazy var wenImageView: UIImageView = {
        let wenImageView = UIImageView()
        
        wenImageView.image = UIImage(named: "imagwenhao")
        return wenImageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgImageView)
        addSubview(ppImageView)
        addSubview(scro)
        scro.addSubview(ctImageView)
        scro.addSubview(cinImageView)
        
        cinImageView.addSubview(mlabel)
        cinImageView.addSubview(priBtn)
        cinImageView.addSubview(loanBtn)
        
        scro.addSubview(queeyImageView)
        queeyImageView.addSubview(mnlabel)
        queeyImageView.addSubview(wscro)
        
        queeyImageView.insertSubview(wenImageView, belowSubview: mnlabel)
        wscro.addSubview(traBtn)
        wscro.addSubview(accountBtn)
        wscro.addSubview(ballBtn)
        
        bgImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        ppImageView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(353)
        }
        scro.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        ctImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(112)
            make.width.equalTo(335)
            make.height.equalTo(420)
        }
        cinImageView.snp.makeConstraints { make in
            make.top.equalTo(ctImageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 335, height: 133))
        }
        
        mlabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14)
            make.left.equalToSuperview().offset(17)
            make.centerX.equalToSuperview()
        }
        
        priBtn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(17)
            make.top.equalTo(mlabel.snp.bottom).offset(16)
            make.size.equalTo(CGSize(width: 130, height: 46))
        }
        
        loanBtn.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-17)
            make.top.equalTo(mlabel.snp.bottom).offset(16)
            make.size.equalTo(CGSize(width: 130, height: 46))
        }
        
        queeyImageView.snp.makeConstraints { make in
            make.top.equalTo(cinImageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 335, height: 142))
            make.bottom.equalToSuperview().offset(-20)
        }
        
        
        mnlabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14)
            make.left.equalToSuperview().offset(17)
            make.centerX.equalToSuperview()
        }
        wenImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.size.equalTo(CGSize(width: 64, height: 71))
        }
        
        wscro.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview()
            make.top.equalTo(mnlabel.snp.bottom).offset(25)
            make.height.equalTo(46)
        }
        
        traBtn.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.bottom.equalToSuperview()
            make.width.equalTo(140)
        }
       
        accountBtn.snp.makeConstraints { make in
            make.left.equalTo(traBtn.snp.right).offset(10)
            make.top.bottom.equalToSuperview()
            make.width.equalTo(140)
        }
        
        ballBtn.snp.makeConstraints { make in
            make.left.equalTo(accountBtn.snp.right).offset(10)
            make.top.bottom.equalToSuperview()
            make.width.equalTo(166)
            make.right.equalToSuperview().offset(-10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class TwoView: UIView {
    
    var block: ((String) -> Void)?
    
    let disposeBag = DisposeBag()
    
    var model = BehaviorRelay<preferredaModel?>(value: nil)
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.init(cssStr: "#F6F7F6")
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.register(LLProductCell.self, forCellReuseIdentifier: "LLProductCell")
        return tableView
    }()
    
    lazy var ctImageView: UIImageView = {
        let ctImageView = UIImageView()
        ctImageView.image = UIImage(named: "bgimageapoi")
        ctImageView.isUserInteractionEnabled = true
        return ctImageView
    }()
    
    lazy var whitwView: UIImageView = {
        let whitwView = UIImageView()
        whitwView.isUserInteractionEnabled = true
        whitwView.image = UIImage(named: "repagemen")
        return whitwView
    }()
    
    lazy var lunboView: TYCyclePagerView = {
        let lunboView = TYCyclePagerView()
        lunboView.delegate = self
        lunboView.dataSource = self
        lunboView.backgroundColor = .clear
        lunboView.isInfiniteLoop = true
        lunboView.autoScrollInterval = 2
        lunboView.register(LLGunCell.self, forCellWithReuseIdentifier: "LLGunCell")
        return lunboView
    }()
    
    lazy var lunboTeiView: TYCyclePagerView = {
        let lunboTeiView = TYCyclePagerView()
        lunboTeiView.delegate = self
        lunboTeiView.dataSource = self
        lunboTeiView.backgroundColor = .clear
        lunboTeiView.isInfiniteLoop = true
        lunboTeiView.autoScrollInterval = 2
        lunboTeiView.register(LLTitleCell.self, forCellWithReuseIdentifier: "LLTitleCell")
        return lunboTeiView
    }()
    
    lazy var clickone: UIImageView = {
        let ctImageView = UIImageView()
        ctImageView.image = UIImage(named: "procadimagea")
        return ctImageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        
        model
            .compactMap { $0?.greaterone?.aviolence }
            .asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: "LLProductCell", cellType: LLProductCell.self)) { row, model, cell in
                cell.backgroundColor = .clear
                cell.selectionStyle = .none
                cell.model.accept(model)
            }.disposed(by: disposeBag)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TwoView: UITableViewDelegate, TYCyclePagerViewDelegate, TYCyclePagerViewDataSource  {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return StatusBarHelper.getStatusBarHeight() + 336
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = UIView()
        headView.addSubview(ctImageView)
        self.ctImageView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(353)
        }
        
        let count = model.value?.toldyou?.aviolence?.count ?? 0
        let couutq = model.value?.herplacid?.aviolence.count ?? 0
        if count > 1 {
            lunboTeiView.isInfiniteLoop = true
        }else {
            lunboTeiView.isInfiniteLoop = false
        }
        
        if couutq > 1 {
            lunboView.isInfiniteLoop = true
        }else {
            lunboView.isInfiniteLoop = false
        }
        
        if count != 0 {
            ctImageView.addSubview(whitwView)
            whitwView.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.left.equalToSuperview().offset(18)
                make.top.equalToSuperview().offset(137)
                make.height.equalTo(40)
            }
            
            whitwView.addSubview(lunboTeiView)
            lunboTeiView.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.left.equalToSuperview().offset(10)
                make.height.equalTo(40)
                make.right.equalToSuperview().offset(-110)
            }
        }
        
        ctImageView.addSubview(lunboView)
        lunboView.snp.makeConstraints { make in
            if count != 0 {
                make.top.equalToSuperview().offset(196)
            }else {
                make.top.equalToSuperview().offset(137)
            }
            make.left.equalToSuperview().offset(17)
            make.centerX.equalToSuperview()
            make.height.equalTo(140)
        }
        
        headView.addSubview(clickone)
        
        clickone.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(17)
            make.size.equalTo(CGSize(width: 116, height: 30))
        }
        
        return headView
    }
    
    func numberOfItems(in pagerView: TYCyclePagerView) -> Int {
        if pagerView == lunboView {
            return model.value?.herplacid?.aviolence.count ?? 0
        }else {
            return model.value?.toldyou?.aviolence?.count ?? 0
        }
        
    }
    
    func pagerView(_ pagerView: TYCyclePagerView, cellForItemAt index: Int) -> UICollectionViewCell {
        if pagerView == lunboView {
            guard let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "LLGunCell", for: index) as? LLGunCell else { return UICollectionViewCell() }
            let arrayimage = model.value?.herplacid?.aviolence
            let model = arrayimage?[index]
            cell.icon.kf.setImage(with: URL(string: model?.caring ?? ""))
            return cell
        }else {
            guard let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "LLTitleCell", for: index) as? LLTitleCell else { return UICollectionViewCell() }
            let arrayimage = model.value?.toldyou?.aviolence
            let model = arrayimage?[index]
            cell.mlabel.text = model?.whey ?? ""
            cell.mlabel.textColor = UIColor.init(cssStr: model?.unawareof ?? "#000000")
            return cell
        }
        
    }
    
    func pagerView(_ pagerView: TYCyclePagerView, didSelectItemAt index: Int) {
        if pagerView == lunboView {
            let model = model.value?.herplacid?.aviolence[index]
            let foryou = model?.foryou ?? ""
            if !foryou.isEmpty {
                self.block?(foryou)
            }
        }else {
            let model = model.value?.toldyou?.aviolence?[index]
            let foryou = model?.foryou ?? ""
            if !foryou.isEmpty {
                self.block?(foryou)
            }
        }
    }
    
    func layout(for pagerView: TYCyclePagerView) -> TYCyclePagerViewLayout {
        let layout = TYCyclePagerViewLayout()
        layout.itemSize = CGSizeMake(sc_width - 34, 140)
        layout.itemSpacing = 5
        return layout
    }
    
}

class LLGunCell: UICollectionViewCell {
    
    let disposeBag = DisposeBag()
    
    lazy var icon: UIImageView = {
        let icon = UIImageView()
        return icon
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(icon)
        icon.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class LLTitleCell: UICollectionViewCell {
    
    let disposeBag = DisposeBag()
    
    lazy var mlabel: UILabel = {
        let mlabel = UILabel()
        mlabel.textColor = .black
        mlabel.textAlignment = .left
        mlabel.numberOfLines = 2
        mlabel.font = UIFont(name: Bold_SFDisplay, size: 15)
        return mlabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mlabel)
        mlabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class LLProductCell: UITableViewCell {
    
    let disposeBag = DisposeBag()
    
    var model = BehaviorRelay<aviolenceModel?>(value: nil)
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .white
        bgView.layer.cornerRadius = 8
        return bgView
    }()
    
    lazy var mlabel: PaddedLabel = {
        let mlabel = PaddedLabel()
        mlabel.textColor = UIColor.init(cssStr: "#21FB91")
        mlabel.textAlignment = .center
        mlabel.font = UIFont(name: Bold_SFDisplay, size: 14)
        mlabel.backgroundColor = UIColor.init(cssStr: "#112724")
        mlabel.padding = UIEdgeInsets(top: 1, left: 3, bottom: 1, right: 3)
        return mlabel
    }()
    
    lazy var ctImageView: UIImageView = {
        let ctImageView = UIImageView()
        ctImageView.backgroundColor = UIColor.init(cssStr: "#D9D9D9")
        return ctImageView
    }()
    
    lazy var mylabel: UILabel = {
        let mylabel = UILabel()
        mylabel.textColor = .black
        mylabel.textAlignment = .left
        mylabel.font = UIFont(name: Bold_SFDisplay, size: 24)
        return mylabel
    }()
    
    lazy var deslabel: UILabel = {
        let deslabel = UILabel()
        deslabel.textColor = UIColor.init(cssStr: "#999999")
        deslabel.textAlignment = .left
        deslabel.font = UIFont(name: Regular_SFDisplay, size: 14)
        return deslabel
    }()
    
    lazy var nextlabel: UILabel = {
        let nextlabel = UILabel()
        nextlabel.textColor = .black
        nextlabel.textAlignment = .center
        nextlabel.font = UIFont(name: Bold_SFDisplay, size: 18)
        nextlabel.backgroundColor = UIColor.init(cssStr: "#21FB91")
        return nextlabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(bgView)
        bgView.addSubview(mlabel)
        bgView.addSubview(ctImageView)
        bgView.addSubview(mylabel)
        bgView.addSubview(deslabel)
        bgView.addSubview(nextlabel)
        
        bgView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(17)
        }
        
        mlabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(21)
        }
        ctImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.top.equalTo(mlabel.snp.bottom).offset(9)
            make.size.equalTo(CGSize(width: 48, height: 48))
            make.bottom.equalToSuperview().offset(-10)
        }
        mylabel.snp.makeConstraints { make in
            make.height.equalTo(36)
            make.left.equalTo(ctImageView.snp.right).offset(12)
            make.top.equalTo(mlabel.snp.bottom).offset(7)
        }
        deslabel.snp.makeConstraints { make in
            make.bottom.equalTo(ctImageView.snp.bottom).offset(1)
            make.height.equalTo(21)
            make.left.equalTo(ctImageView.snp.right).offset(12)
        }
        nextlabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-12)
            make.size.equalTo(CGSize(width: 89, height: 45))
        }
        
        model.asObservable().subscribe(onNext: { [weak self] mon in
            guard let self = self, let mmo = mon else { return }
            self.mlabel.text = mmo.blot ?? ""
            self.mylabel.text = mmo.itseemed ?? ""
            self.deslabel.text = mmo.toanyone ?? ""
            self.ctImageView.kf.setImage(with: URL(string: mmo.makeyou ?? ""))
            let thenyou = mmo.thenyou ?? ""
            self.nextlabel.isHidden = thenyou.isEmpty
            if !thenyou.isEmpty {
                self.nextlabel.text = mmo.thenyou ?? ""
            }
        }).disposed(by: disposeBag)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class PaddedLabel: UILabel {
    var padding: UIEdgeInsets = .zero
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: padding.top, left: padding.left, bottom: padding.bottom, right: padding.right)
        let paddedRect = rect.inset(by: insets)
        super.drawText(in: paddedRect)
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        let widthWithPadding = size.width + padding.left + padding.right
        let heightWithPadding = size.height + padding.top + padding.bottom
        return CGSize(width: widthWithPadding, height: heightWithPadding)
    }
}
