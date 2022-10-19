//
//  FeedViewController.swift
//  Navigation
//
//  Created by Андрей Таланчук on 19.10.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    var postVC = PostViewController()
    var feedView = FeedView()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Новости"
        addView()
        setLayout()
        addTargets()
    }
    
    func addView(){
        view.addSubview(feedView)
        feedView.setView()
    }
    
    func setLayout(){
        NSLayoutConstraint.activate([feedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     feedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     feedView.topAnchor.constraint(equalTo: view.topAnchor),
                                     feedView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
    
    func addTargets(){
        feedView.postButton1.addTarget(self, action: #selector(actionPostButton), for: .touchUpInside)
        feedView.postButton2.addTarget(self, action: #selector(actionPostButton), for: .touchUpInside)
    }
    
    @objc
    func actionPostButton(_ button: UIButton){
//        navigationController?.present(postVC, animated: true) { [weak self] in
//            guard let self = self else {return}
//            self.postVC.viewTitel = self.post.title
//        }
        navigationController?.pushViewController(postVC, animated: true)
        postVC.viewTitel = button.currentTitle
    }
}
