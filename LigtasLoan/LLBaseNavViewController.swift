//
//  LLBaseNavViewController.swift
//  LigtasLoan
//
//  Created by LigtasLoan on 2024/10/22.
//

import UIKit

class LLBaseNavViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.isHidden = true
        self.navigationBar.isTranslucent = false
    }
    
}

extension LLBaseNavViewController {
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    
}
