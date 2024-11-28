//
//  LLTypePopView.swift
//  LigtasLoan
//
//  Created by LigtasLoan on 2024/10/27.
//

import UIKit

class PopPhotoView: UIView {
    
    lazy var scro: UIScrollView = {
        let scro = UIScrollView()
        scro.backgroundColor = .white
        scro.showsHorizontalScrollIndicator = false
        scro.showsVerticalScrollIndicator = false
        scro.contentInsetAdjustmentBehavior = .never
        return scro
    }()
    
    lazy var mlabel: UILabel = {
        let mlabel = UILabel()
        mlabel.numberOfLines = 0
        mlabel.text = "Please upload the front side of your identification document."
        mlabel.textColor = UIColor.init(cssStr: "#000011")
        mlabel.textAlignment = .left
        mlabel.font = UIFont(name: Bold_SFDisplay, size: 14)
        return mlabel
    }()
    
    lazy var backBtn: UIButton = {
        let backBtn = UIButton(type: .custom)
        backBtn.setImage(UIImage(named: "canimageb"), for: .normal)
        return backBtn
    }()
    
    lazy var ctImageView: UIImageView = {
        let ctImageView = UIImageView()
        return ctImageView
    }()
    
    lazy var ctImageView1: UIImageView = {
        let ctImageView1 = UIImageView()
        ctImageView1.image = UIImage(named: "ambidimage")
        ctImageView1.contentMode = .scaleAspectFill
        return ctImageView1
    }()
    
    lazy var nextBtn: UIButton = {
        let nextBtn = UIButton(type: .custom)
        nextBtn.setTitle("ALBUM", for: .normal)
        nextBtn.titleLabel?.font = UIFont(name: Bold_SFDisplay, size: 18)
        nextBtn.backgroundColor = .white
        nextBtn.layer.borderWidth = 2
        nextBtn.setTitleColor(UIColor.init(cssStr: "#222222"), for: .normal)
        nextBtn.layer.borderColor = UIColor.init(cssStr: "#222222")?.cgColor
        return nextBtn
    }()
    
    lazy var nextBtn1: UIButton = {
        let nextBtn1 = UIButton(type: .custom)
        nextBtn1.setTitleColor(UIColor.init(cssStr: "#1EFB91"), for: .normal)
        nextBtn1.setTitle("SHOOT", for: .normal)
        nextBtn1.titleLabel?.font = UIFont(name: Bold_SFDisplay, size: 18)
        nextBtn1.backgroundColor = UIColor.init(cssStr: "#222222")
        return nextBtn1
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(scro)
        scro.addSubview(mlabel)
        scro.addSubview(backBtn)
        scro.addSubview(ctImageView)
        scro.addSubview(ctImageView1)
        scro.addSubview(nextBtn)
        scro.addSubview(nextBtn1)
        scro.snp.makeConstraints { make in
            make.bottom.left.equalToSuperview()
            make.width.equalTo(sc_width)
            make.top.equalToSuperview().offset(215)
        }
        mlabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(19)
            make.width.equalTo(sc_width - 84)
        }
        backBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(19)
            make.left.equalTo(sc_width - 40)
            make.size.equalTo(CGSize(width: 24, height: 24))
        }
        ctImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(79)
            make.left.equalToSuperview().offset(15)
            make.width.equalTo(sc_width - 30)
            make.height.equalTo(212)
        }
        ctImageView1.snp.makeConstraints { make in
            make.top.equalTo(ctImageView.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(15)
            make.width.equalTo(sc_width - 30)
            make.height.equalTo(106)
        }
        nextBtn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(12)
            make.width.equalTo(sc_width - 25)
            make.top.equalTo(ctImageView1.snp.bottom).offset(42)
            make.height.equalTo(56)
        }
        nextBtn1.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(12)
            make.width.equalTo(sc_width - 25)
            make.top.equalTo(nextBtn.snp.bottom).offset(15)
            make.height.equalTo(56)
            make.bottom.equalToSuperview().offset(-30)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class PopCameraView: UIView {
    
    lazy var scro: UIScrollView = {
        let scro = UIScrollView()
        scro.backgroundColor = .white
        scro.showsHorizontalScrollIndicator = false
        scro.showsVerticalScrollIndicator = false
        scro.contentInsetAdjustmentBehavior = .never
        return scro
    }()
    
    lazy var mlabel: UILabel = {
        let mlabel = UILabel()
        mlabel.numberOfLines = 0
        mlabel.text = "Please upload a copy of the front side of your identification."
        mlabel.textColor = UIColor.init(cssStr: "#000011")
        mlabel.textAlignment = .left
        mlabel.font = UIFont(name: Bold_SFDisplay, size: 14)
        return mlabel
    }()
    
    lazy var backBtn: UIButton = {
        let backBtn = UIButton(type: .custom)
        backBtn.setImage(UIImage(named: "canimageb"), for: .normal)
        return backBtn
    }()
    
    lazy var ctImageView: UIImageView = {
        let ctImageView = UIImageView()
        ctImageView.image = UIImage(named: "Grohellimge")
        ctImageView.contentMode = .scaleAspectFill
        return ctImageView
    }()
    
    lazy var ctImageView1: UIImageView = {
        let ctImageView1 = UIImageView()
        ctImageView1.image = UIImage(named: "Grhellcaim")
        ctImageView1.contentMode = .scaleAspectFill
        return ctImageView1
    }()
    
    lazy var nextBtn1: UIButton = {
        let nextBtn1 = UIButton(type: .custom)
        nextBtn1.setTitleColor(UIColor.init(cssStr: "#1EFB88"), for: .normal)
        nextBtn1.setTitle("SUBMIT", for: .normal)
        nextBtn1.titleLabel?.font = UIFont(name: Bold_SFDisplay, size: 18)
        nextBtn1.backgroundColor = UIColor.init(cssStr: "#222233")
        return nextBtn1
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(scro)
        scro.addSubview(mlabel)
        scro.addSubview(backBtn)
        scro.addSubview(ctImageView)
        scro.addSubview(ctImageView1)
        scro.addSubview(nextBtn1)
        scro.snp.makeConstraints { make in
            make.bottom.left.equalToSuperview()
            make.width.equalTo(sc_width)
            make.top.equalToSuperview().offset(295)
        }
        mlabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(19)
            make.width.equalTo(sc_width - 84)
        }
        backBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(19)
            make.left.equalTo(sc_width - 40)
            make.size.equalTo(CGSize(width: 24, height: 24))
        }
        ctImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(79)
            make.left.equalToSuperview().offset(15)
            make.width.equalTo(sc_width - 30)
            make.height.equalTo(212)
        }
        ctImageView1.snp.makeConstraints { make in
            make.top.equalTo(ctImageView.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(15)
            make.width.equalTo(sc_width - 30)
            make.height.equalTo(106)
        }
        nextBtn1.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(12)
            make.width.equalTo(sc_width - 25)
            make.top.equalTo(ctImageView1.snp.bottom).offset(30)
            make.height.equalTo(56)
            make.bottom.equalToSuperview().offset(-30)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class PopNameIDCardView: UIView {
    
    var model: preferredaModel? {
        didSet {
            guard let model = model else { return }
            name1.nextBtn.setTitle(model.deepseats ?? "", for: .normal)
            name2.inputtx.text = model.aquizzical ?? ""
            name3.inputtx.text = model.squatty ?? ""
        }
    }
    
    lazy var scro: UIScrollView = {
        let scro = UIScrollView()
        scro.backgroundColor = .white
        scro.showsHorizontalScrollIndicator = false
        scro.showsVerticalScrollIndicator = false
        scro.contentInsetAdjustmentBehavior = .never
        return scro
    }()
    
    lazy var mlabel: UILabel = {
        let mlabel = UILabel()
        mlabel.numberOfLines = 0
        mlabel.text = "Confirm the provided information, please."
        mlabel.textColor = UIColor.init(cssStr: "#000011")
        mlabel.textAlignment = .left
        mlabel.font = UIFont(name: Bold_SFDisplay, size: 14)
        return mlabel
    }()
    
    lazy var backBtn: UIButton = {
        let backBtn = UIButton(type: .custom)
        backBtn.setImage(UIImage(named: "canimageb"), for: .normal)
        return backBtn
    }()
    
    lazy var name1: LLNameView = {
        let name1 = LLNameView(frame: .zero, ad: .btn)
        name1.mlabel.text = "Date"
        return name1
    }()
    
    lazy var name2: LLNameView = {
        let name2 = LLNameView(frame: .zero, ad: .tx)
        name2.mlabel.text = "Name"
        return name2
    }()
    
    lazy var name3: LLNameView = {
        let name3 = LLNameView(frame: .zero, ad: .tx)
        name3.mlabel.text = "Number"
        return name3
    }()
    
    lazy var inputtx: UITextField = {
        let inputtx = UITextField()
        inputtx.font = UIFont(name: Bold_SFDisplay, size: 16)
        inputtx.textColor = UIColor.init(cssStr: "#000011")?.withAlphaComponent(0.5)
        inputtx.backgroundColor = .purple
        return inputtx
    }()
    
    lazy var nextBtn1: UIButton = {
        let nextBtn1 = UIButton(type: .custom)
        nextBtn1.setTitleColor(UIColor.init(cssStr: "#1EFC91"), for: .normal)
        nextBtn1.setTitle("SUBMIT", for: .normal)
        nextBtn1.titleLabel?.font = UIFont(name: Bold_SFDisplay, size: 18)
        nextBtn1.backgroundColor = UIColor.init(cssStr: "#222332")
        return nextBtn1
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(scro)
        scro.addSubview(mlabel)
        scro.addSubview(backBtn)
        scro.addSubview(name1)
        scro.addSubview(name2)
        scro.addSubview(name3)
        scro.addSubview(inputtx)
        scro.addSubview(nextBtn1)
        scro.snp.makeConstraints { make in
            make.bottom.left.equalToSuperview()
            make.width.equalTo(sc_width)
            make.top.equalToSuperview().offset(300)
        }
        mlabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(19)
            make.width.equalTo(sc_width - 84)
        }
        backBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(19)
            make.left.equalTo(sc_width - 40)
            make.size.equalTo(CGSize(width: 24, height: 24))
        }
        
        name1.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.height.equalTo(95)
            make.width.equalTo(sc_width)
            make.top.equalTo(mlabel.snp.bottom).offset(40)
        }
        name2.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.height.equalTo(95)
            make.width.equalTo(sc_width)
            make.top.equalTo(name1.snp.bottom).offset(15)
        }
        name3.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.height.equalTo(95)
            make.width.equalTo(sc_width)
            make.top.equalTo(name2.snp.bottom).offset(15)
        }
        nextBtn1.snp.makeConstraints { make in
            make.top.equalTo(name3.snp.bottom).offset(49)
            make.left.equalToSuperview().offset(12)
            make.width.equalTo(sc_width - 25)
            make.height.equalTo(56)
            make.bottom.equalToSuperview().offset(-30)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

enum Bgtype {
    case tx
    case btn
}

class LLNameView: UIView {
    
    var ad: Bgtype = .tx
    
    lazy var mlabel: UILabel = {
        let mlabel = UILabel()
        mlabel.textColor = UIColor.init(cssStr: "#000011")
        mlabel.textAlignment = .left
        mlabel.font = UIFont(name: Bold_SFDisplay, size: 16)
        return mlabel
    }()
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .init(cssStr: "#F3F8F5")
        bgView.layer.cornerRadius = 4
        return bgView
    }()
    
    lazy var inputtx: UITextField = {
        let inputtx = UITextField()
        inputtx.font = UIFont(name: Bold_SFDisplay, size: 16)
        inputtx.textColor = UIColor.init(cssStr: "#000011")?.withAlphaComponent(0.5)
        return inputtx
    }()
    
    lazy var nextBtn: UIButton = {
        let nextBtn = UIButton(type: .custom)
        nextBtn.contentHorizontalAlignment = .left
        nextBtn.setTitleColor(UIColor.init(cssStr: "#000011")?.withAlphaComponent(0.5), for: .normal)
        nextBtn.titleLabel?.font = UIFont(name: Bold_SFDisplay, size: 16)
        return nextBtn
    }()
    
    init(frame: CGRect, ad: Bgtype) {
        self.ad = ad
        super.init(frame: frame)
        setupView(from: ad)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(from type: Bgtype) {
        addSubview(mlabel)
        addSubview(bgView)
        mlabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(20)
        }
        bgView.snp.makeConstraints { make in
            make.width.equalTo(sc_width - 30)
            make.left.equalToSuperview().offset(15)
            make.top.equalTo(mlabel.snp.bottom).offset(8)
            make.height.equalTo(65)
        }
        if type == .tx {
            bgView.addSubview(inputtx)
            inputtx.isUserInteractionEnabled = true
            inputtx.snp.makeConstraints { make in
                make.top.bottom.equalToSuperview()
                make.width.equalTo(sc_width - 50)
                make.left.equalToSuperview().offset(12)
            }
        }else {
            bgView.addSubview(nextBtn)
            nextBtn.snp.makeConstraints { make in
                make.top.bottom.equalToSuperview()
                make.width.equalTo(sc_width - 50)
                make.left.equalToSuperview().offset(12)
            }
        }
        
        
    }

}

