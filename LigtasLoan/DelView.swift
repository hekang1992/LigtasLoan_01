//
//  Untitled.swift
//  LigtasLoan
//
//  Created by 何康 on 2024/11/28.
//

import UIKit
import RxSwift
import RxRelay

class DelView: UIView {
    
    var block: (() -> Void)?
    var block1: (() -> Void)?
    
    let disposeBag = DisposeBag()
    
    lazy var ctImageView: UIImageView = {
        let ctImageView = UIImageView()
        ctImageView.contentMode = .scaleAspectFit
        ctImageView.isUserInteractionEnabled = true
        return ctImageView
    }()
    
    lazy var btn1: UIButton = {
        let btn1 = UIButton(type: .custom)
        return btn1
    }()
    
    lazy var btn2: UIButton = {
        let btn2 = UIButton(type: .custom)
        btn2.setImage(UIImage(named: "altcancel"), for: .normal)
        return btn2
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(ctImageView)
        ctImageView.addSubview(btn1)
        ctImageView.addSubview(btn2)
        
        ctImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 345, height: 363))
        }
        btn1.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 320, height: 56))
            make.top.equalToSuperview().offset(223)
        }
        btn2.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 320, height: 56))
            make.top.equalTo(btn1.snp.bottom).offset(13)
        }
        
        btn1.rx.tap.subscribe(onNext: { [weak self] in
            self?.block?()
        }).disposed(by: disposeBag)
        btn2.rx.tap.subscribe(onNext: { [weak self] in
            self?.block1?()
        }).disposed(by: disposeBag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


class LLRightView: UIView {
    
    lazy var minelabel: UILabel = {
        let minelabel = UILabel()
        minelabel.text = "Mine"
        minelabel.textColor = UIColor.white
        minelabel.textAlignment = .center
        minelabel.font = UIFont(name: Bold_SFDisplay, size: 30)
        return minelabel
    }()
    
    lazy var bbImageView: UIImageView = {
        let bbImageView = UIImageView()
        bbImageView.image = UIImage(named: "bbimageimad")
        return bbImageView
    }()
    
    lazy var bgImageView: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "llbasebg")
        return bgImageView
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.backgroundColor = .clear
        return scrollView
    }()
    
    lazy var ctImageView: UIImageView = {
        let ctImageView = UIImageView()
        ctImageView.image = UIImage(named: "bgimagecen")
        return ctImageView
    }()
    
    lazy var mlabel: UILabel = {
        let mlabel = UILabel()
        let phone = UserDefaults.standard.object(forKey: LL_LOGIN) as? String ?? ""
        mlabel.text = phone
        mlabel.textColor = UIColor.init(cssStr: "#0F0C03")
        mlabel.textAlignment = .center
        mlabel.font = UIFont(name: Bold_SFDisplay, size: 18)
        return mlabel
    }()
    
    lazy var bImageView: UIImageView = {
        let bImageView = UIImageView()
        bImageView.image = UIImage(named: "bgimageimface")
        bImageView.isUserInteractionEnabled = true
        return bImageView
    }()
    
    lazy var itemView1: LLRightItemView = {
        let itemView1 = LLRightItemView()
        itemView1.mlabel.text = "Order Records"
        return itemView1
    }()
    
    lazy var itemView2: LLRightItemView = {
        let itemView2 = LLRightItemView()
        itemView2.mlabel.text = "The Official Website"
        return itemView2
    }()
    
    lazy var itemView3: LLRightItemView = {
        let itemView3 = LLRightItemView()
        itemView3.mlabel.text = "Connect With Us"
        return itemView3
    }()
    
    lazy var itemView4: LLRightItemView = {
        let itemView4 = LLRightItemView()
        itemView4.mlabel.text = "Settings"
        return itemView4
    }()
    
    lazy var itemView5: LLRightItemView = {
        let itemView5 = LLRightItemView()
        itemView5.mlabel.text = "Delete Account"
        return itemView5
    }()
    
    lazy var itemView6: LLRightItemView = {
        let itemView6 = LLRightItemView()
        itemView6.mlabel.text = "Log Out"
        return itemView6
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgImageView)
        addSubview(bbImageView)
        addSubview(scrollView)
        scrollView.addSubview(minelabel)
        scrollView.addSubview(ctImageView)
        ctImageView.addSubview(mlabel)
        scrollView.addSubview(bImageView)
        bImageView.addSubview(itemView1)
        bImageView.addSubview(itemView2)
        bImageView.addSubview(itemView3)
        bImageView.addSubview(itemView4)
        bImageView.addSubview(itemView5)
        bImageView.addSubview(itemView6)
        bgImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        bbImageView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(339)
        }
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        minelabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(StatusBarHelper.getStatusBarHeight() + 15)
            make.height.equalTo(32)
        }
        ctImageView.snp.makeConstraints { make in
            make.height.equalTo(163)
            make.top.equalTo(minelabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(335)
        }
        mlabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(ctImageView.snp.top).offset(115)
            make.height.equalTo(40)
        }
        
        bImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(ctImageView.snp.bottom).offset(17)
            make.width.equalTo(340)
            make.height.equalTo(540)
            make.bottom.equalToSuperview().offset(-20)
        }
        
        itemView1.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(14)
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(50)
        }
        itemView2.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(itemView1.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(46)
        }
        itemView3.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(itemView2.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(46)
        }
        itemView4.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(itemView3.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(46)
        }
        
        itemView5.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(itemView4.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(46)
        }
        itemView6.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(itemView5.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(46)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class LLRightItemView: UIView {

    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.layer.cornerRadius = 4
        bgView.backgroundColor = UIColor.init(cssStr: "#E4FEG5")
        return bgView
    }()

    lazy var mlabel: UILabel = {
        let mlabel = UILabel()
        mlabel.textColor = UIColor.init(cssStr: "#000011")
        mlabel.textAlignment = .left
        mlabel.font = UIFont(name: Bold_SFDisplay, size: 16)
        return mlabel
    }()
    
    lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "righticon")
        return iconImageView
    }()
    
    lazy var btn: UIButton = {
        let btn = UIButton(type: .custom)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        bgView.addSubview(mlabel)
        bgView.addSubview(iconImageView)
        bgView.addSubview(btn)
        bgView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(50)
        }
        mlabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.bottom.top.equalToSuperview()
            make.right.equalToSuperview().offset(-60)
        }
        iconImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-16)
            make.size.equalTo(CGSize(width: 16, height: 16))
        }
        btn.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
