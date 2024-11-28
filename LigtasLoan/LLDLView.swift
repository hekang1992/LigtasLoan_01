//
//  LLDLView.swift
//  LigtasLoan
//
//  Created by LigtasLoan on 2024/10/22.
//

import UIKit
import RxSwift
import SnapKit

class LLDLView: UIView {
    
    let disposeBag = DisposeBag()
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .white
        bgView.layer.cornerRadius = 10
        return bgView
    }()
    
    lazy var bgImageView: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "llbasebg")
        bgImageView.contentMode = .scaleAspectFill
        bgImageView.isUserInteractionEnabled = true
        return bgImageView
    }()
    
    lazy var helloImageView: UIImageView = {
        let helloImageView = UIImageView()
        helloImageView.image = UIImage(named: "hellodimge")
        return helloImageView
    }()
    
    lazy var ppImageView: UIImageView = {
        let ppImageView = UIImageView()
        ppImageView.image = UIImage(named: "ppopleimge")
        return ppImageView
    }()
    
    lazy var ctImageView: UIImageView = {
        let ctImageView = UIImageView()
        ctImageView.image = UIImage(named: "Grouphhe")
        return ctImageView
    }()
    
    lazy var sImageView: UIImageView = {
        let sImageView = UIImageView()
        sImageView.image = UIImage(named: "shurukuangimage")
        sImageView.isUserInteractionEnabled = true
        return sImageView
    }()
    
    lazy var codeImageView: UIImageView = {
        let codeImageView = UIImageView()
        codeImageView.image = UIImage(named: "codeimgecc")
        codeImageView.contentMode = .scaleAspectFill
        codeImageView.isUserInteractionEnabled = true
        return codeImageView
    }()
    
    lazy var phoneTx: UITextField = {
        let phoneTx = UITextField()
        phoneTx.keyboardType = .numberPad
        let attrString = NSMutableAttributedString(string: "Enter Phone Number", attributes: [
            .foregroundColor: UIColor.black.withAlphaComponent(0.2) as Any,
            .font: UIFont(name: Bold_SFDisplay, size: 14)!
        ])
        phoneTx.attributedPlaceholder = attrString
        phoneTx.font = UIFont(name: Bold_SFDisplay, size: 14)
        phoneTx.textColor = UIColor.init(cssStr: "#000011")
        return phoneTx
    }()
    
    lazy var codeTx: UITextField = {
        let codeTx = UITextField()
        codeTx.keyboardType = .numberPad
        let attrString = NSMutableAttributedString(string: "Enter Verification Code", attributes: [
            .foregroundColor: UIColor.init(cssStr: "#000011")?.withAlphaComponent(0.2) as Any,
            .font: UIFont(name: Bold_SFDisplay, size: 14)!
        ])
        codeTx.attributedPlaceholder = attrString
        codeTx.font = UIFont(name: Bold_SFDisplay, size: 14)
        codeTx.textColor = UIColor.init(cssStr: "#000011")
        return codeTx
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
    
    lazy var codeBtn: UIButton = {
        let codeBtn = UIButton(type: .custom)
        codeBtn.setTitle("Send", for: .normal)
        codeBtn.contentHorizontalAlignment = .right
        codeBtn.setTitleColor(UIColor.black, for: .normal)
        codeBtn.titleLabel?.font = UIFont(name: Bold_SFDisplay, size: 18)
        return codeBtn
    }()
    
    lazy var nextBtn: UIButton = {
        let nextBtn = UIButton(type: .custom)
        nextBtn.isEnabled = false
        nextBtn.setTitle("Login", for: .normal)
        nextBtn.setTitleColor(.white, for: .normal)
        nextBtn.titleLabel?.font = UIFont(name: Bold_SFDisplay, size: 20)
        nextBtn.setBackgroundImage(UIImage(named: "nextimagebbt"), for: .normal)
        return nextBtn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(bgImageView)
        bgImageView.addSubview(bgView)
        bgImageView.addSubview(ctImageView)
        
        bgView.addSubview(sImageView)
        sImageView.addSubview(phoneTx)
        bgView.addSubview(codeImageView)
        codeImageView.addSubview(codeTx)
        
        bgImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        bgView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(194)
            make.left.equalToSuperview().offset(20)
            make.height.equalTo(220)
        }
        
        bgImageView.addSubview(helloImageView)
        bgImageView.insertSubview(ppImageView, belowSubview: bgView)
        
        helloImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.size.equalTo(CGSize(width: 274, height: 46))
            make.bottom.equalTo(bgView.snp.top).offset(-33)
        }
        
        ppImageView.snp.makeConstraints { make in
            make.bottom.equalTo(bgView.snp.top).offset(37)
            make.right.equalToSuperview().offset(2)
            make.size.equalTo(CGSize(width: 157, height: 186))
        }
        
        ctImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 128, height: 128))
        }
        
        sImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(50)
        }
        phoneTx.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.bottom.top.equalToSuperview()
            make.left.equalToSuperview().offset(115)
        }
        codeImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(sImageView.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(50)
        }
        codeTx.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-110)
            make.bottom.top.equalToSuperview()
            make.left.equalToSuperview().offset(21)
        }
        
        codeImageView.addSubview(codeBtn)
        bgView.addSubview(nextBtn)
        addSubview(clickLabel)
        
        codeBtn.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-15)
            make.size.equalTo(CGSize(width: 90, height: 18))
        }
        clickLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-40)
            make.left.equalToSuperview().offset(32)
            make.centerX.equalToSuperview()
        }
        nextBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(codeImageView.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(48)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
