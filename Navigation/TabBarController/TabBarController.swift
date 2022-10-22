//
//  TabBarController.swift
//  Navigation
//
//  Created by Андрей Таланчук on 19.10.2022.
//

import UIKit

class TabBarController: UITabBarController {
   
    var feedViewController: UINavigationController!
    var profileViewController: UINavigationController!
    var loginViewController: UINavigationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBar()
        setUpFeedItem()
        setUpProfileItem()
    }
    
    func setUpTabBar(){
        feedViewController = UINavigationController.init(rootViewController: FeedViewController())
        profileViewController = UINavigationController.init(rootViewController: ProfileViewController())
        loginViewController = UINavigationController.init(rootViewController: LogInViewController())
        self.viewControllers = [feedViewController, loginViewController]
        self.tabBar.backgroundColor = .systemGray6
        self.tabBar.layer.borderWidth = 0.3
        self.tabBar.layer.borderColor = UIColor.gray.cgColor
    }
    
    func setUpFeedItem(){
        feedViewController.tabBarItem.title = "Новости"
        feedViewController.tabBarItem.image = UIImage(systemName: "house")
    }
    
    func setUpProfileItem(){
        loginViewController.tabBarItem.title = "Профиль"
        loginViewController.tabBarItem.image = UIImage(systemName: "person")
        loginViewController.navigationBar.isHidden = true
    }
}
