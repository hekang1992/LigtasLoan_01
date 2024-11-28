//
//  LLWYViewController.swift
//  LigtasLoan
//
//  Created by LigtasLoan on 2024/11/2.
//

import UIKit
import RxRelay
import StoreKit
@preconcurrency import WebKit

class LLWYViewController: LLBaseViewController {
    
    lazy var headView: HeadView = {
        let headView = HeadView()
        headView.mlabel.text = "ORDER DETAILS"
        return headView
    }()
    
    lazy var webView: WKWebView = {
        let config = WKWebViewConfiguration()
        let usercc = WKUserContentController()
        let jsfun = ["guitarGar", "tangerine", "jacketYam", "garlicKiw", "monkeyUgl", "mangoHibi"]
        jsfun.forEach { usercc.add(self, name: $0) }
        config.userContentController = usercc
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.scrollView.bounces = false
        webView.scrollView.alwaysBounceVertical = false
        webView.scrollView.contentInsetAdjustmentBehavior = .never
        webView.scrollView.showsVerticalScrollIndicator = false
        webView.scrollView.showsHorizontalScrollIndicator = false
        webView.navigationDelegate = self
        return webView
    }()
    
    var pageUrl = BehaviorRelay<String>(value: "")
    
    lazy var progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.tintColor = UIColor.init(cssStr: "#5AD7F6")
        progressView.trackTintColor = UIColor.init(cssStr: "#F7F7F6")
        return progressView
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
            if self.webView.canGoBack {
                self.webView.goBack()
            }else {
                self.navigationController?.popToRootViewController(animated: true)
            }
        }).disposed(by: disposeBag)
        
        view.addSubview(webView)
        webView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(headView.snp.bottom)
        }
        
        webView.addSubview(progressView)
        progressView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(0.5)
        }
        
        let extendedURL = LLJieURL.appendters(url: pageUrl.value, parameters: LLDLInfo.getLogiInfo()) ?? "".replacingOccurrences(of: " ", with: "%20")
        if let url = URL(string: extendedURL) {
            webView.load(URLRequest(url: url))
        }
        
        webView.rx.observe(String.self, "title")
            .subscribe(onNext: { [weak self] title in
                DispatchQueue.main.async {
                    self?.headView.mlabel.text = title ?? ""
                }
            }).disposed(by: disposeBag)
        
        webView.rx.observe(Double.self, "estimatedProgress")
            .compactMap { $0 }
            .map { Float($0) }
            .bind(to: progressView.rx.progress)
            .disposed(by: disposeBag)
        
        webView.rx.observe(Double.self, "estimatedProgress")
            .compactMap { $0 }
            .filter { $0 == 1.0 }
            .subscribe(onNext: { [weak self] _ in
                self?.progressView.setProgress(0.0, animated: false)
                self?.progressView.isHidden = true
            })
            .disposed(by: disposeBag)
        
    }
    
}

extension LLWYViewController: WKScriptMessageHandler, WKNavigationDelegate {
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print("message:\(message.name)")
        
        switch message.name {
        case "garlicKiw":
            self.navigationController?.popToRootViewController(animated: true)
            
        case "mangoHibi":
            tcshowapp()
            
        case "jacketYam":
            self.navigationController?.popViewController(animated: true)
            
        case "guitarGar":
            handleLocationUpdate(with: message.body)
            
        case "monkeyUgl":
            handleMonkeyUglMessage(with: message.body)
            
        case "tangerine":
            handleTangerineMessage(with: message.body)
            
        default:
            break
        }
    }
    
    private func handleLocationUpdate(with body: Any) {
        guard let array = body as? [String], let first = array.first, let last = array.last else { return }
        locationConfig = LLLocationConfig()
        locationConfig?.startUpdatingLocation { model in
            LLMdMessInfo.bpOInfo(from: model, proloID: first, st: last, jd: LLSBTwoDict.getCurrentTime(), type: "10")
        }
    }
    
    private func handleMonkeyUglMessage(with body: Any) {
        guard let array = body as? [String], let urlString = array.first else { return }
        
        if urlString.hasPrefix("AgaranPesoMail://") {
            handleEmailURL(urlString)
        } else {
            handlePhoneURL(urlString)
        }
    }
    
    private func handleEmailURL(_ urlString: String) {
        guard let range = urlString.range(of: "//") else { return }
        let email = urlString[range.upperBound...]
        
        if let mailURL = URL(string: "mailto:\(email)") {
            let phoneStr = UserDefaults.standard.string(forKey: LL_LOGIN) ?? ""
            let bodyContent = "AgaranPeso: \(phoneStr)"
            var emailString = "\(mailURL)?body=\(bodyContent)"
            emailString = emailString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            
            if let url = URL(string: emailString), UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    
    private func handlePhoneURL(_ urlString: String) {
        guard let range = urlString.range(of: "//") else { return }
        let phoneNumber = urlString[range.upperBound...]
        
        if let phoneURL = URL(string: "tel://\(phoneNumber)"), UIApplication.shared.canOpenURL(phoneURL) {
            UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
        }
    }
    
    private func handleTangerineMessage(with body: Any) {
        guard let array = body as? [String], let first = array.first else { return }
        self.genjuurltovc(from: first)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        guard let url = navigationAction.request.url else {
            decisionHandler(.allow)
            return
        }
        
        if shouldHandleExternalURL(url) {
            openExternalURL(url)
            decisionHandler(.cancel)
        } else {
            decisionHandler(.allow)
        }
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        LoadingManager.addLoadingView()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        LoadingManager.hideLoadingView()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        LoadingManager.hideLoadingView()
    }
    
    private func shouldHandleExternalURL(_ url: URL) -> Bool {
        return url.scheme == "whatsapp" || url.scheme == "mailto"
    }
    
    private func openExternalURL(_ url: URL) {
        guard UIApplication.shared.canOpenURL(url) else {
            showToast(for: url)
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    private func showToast(for url: URL) {
        if url.scheme == "whatsapp" {
            ToastViewConfig.showToast(message: "Please install WhatsApp to continue.")
        } else if url.scheme == "mailto" {
            ToastViewConfig.showToast(message: "Please install and configure the email app on your device.")
        }
    }
    
    private func tcshowapp() {
        if #available(iOS 14.0, *) {
            if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                SKStoreReviewController.requestReview(in: scene)
            }
        } else {
            SKStoreReviewController.requestReview()
        }
    }
    
}
