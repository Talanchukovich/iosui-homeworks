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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBar()
        setUpFeedItem()
        setUpProfileItem()
    }
    
    func setUpTabBar(){
        feedViewController = UINavigationController.init(rootViewController: FeedViewController())
        profileViewController = UINavigationController.init(rootViewController: ProfileViewController())
        self.viewControllers = [feedViewController, profileViewController]
        self.tabBar.backgroundColor = .white
    }
    
    func setUpFeedItem(){
        feedViewController.tabBarItem.title = "Новости"
        feedViewController.tabBarItem.image = UIImage(systemName: "house")
    }
    
    func setUpProfileItem(){
        profileViewController.tabBarItem.title = "Профиль"
        profileViewController.tabBarItem.image = UIImage(systemName: "person")
    }
}
