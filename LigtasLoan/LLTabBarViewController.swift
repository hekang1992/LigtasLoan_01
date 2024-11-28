//
//  LLTabBarViewController.swift
//  LigtasLoan
//
//  Created by LigtasLoan on 2024/11/12.
//

import UIKit

class LLTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = .white
        tabBar.isTranslucent = false
        
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.1
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -2)
        tabBar.layer.shadowRadius = 10
        
        let homeVC = LLSYViewController()
        let profileVC = LLCenterViewController()
        
        
        
        profileVC.tabBarItem = UITabBarItem(
            title: "Center",
            image: UIImage(named: "cennormal")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(named: "censel")?.withRenderingMode(.alwaysOriginal)
        )
        
        homeVC.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(named: "homenormal")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(named: "homesel")?.withRenderingMode(.alwaysOriginal)
        )
        
        homeVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)

        profileVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)

        viewControllers = [
            LLBaseNavViewController(rootViewController: homeVC),
            LLBaseNavViewController(rootViewController: profileVC)
        ]
        tabBar.tintColor = UIColor.init(cssStr: "#333344")
        tabBar.unselectedItemTintColor = UIColor.init(cssStr: "#CDCDDE")
    }
}
