//
//  FeedViewController.swift
//  Navigation
//
//  Created by Андрей Таланчук on 19.10.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    var postVC = PostViewController()
    var post = Post(title: "NewPost")
    var feedView = FeedView()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Новости"
        addView()
        setLayout()
        touchPostButton()
    }
    
    func addView(){
        view.addSubview(feedView.contentView)
        feedView.addView()
    }
    
    func setLayout(){
        feedView.setLayout()
        NSLayoutConstraint.activate([feedView.contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     feedView.contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     feedView.contentView.topAnchor.constraint(equalTo: view.topAnchor),
                                     feedView.contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
    
    func touchPostButton(){
        feedView.postButton.addTarget(self, action: #selector(actionPostButton), for: .touchUpInside)
    }
    
    @objc
    func actionPostButton(){
//        navigationController?.present(postVC, animated: true) { [weak self] in
//            guard let self = self else {return}
//            self.postVC.viewTitel = self.post.title
//        }
        navigationController?.pushViewController(postVC, animated: true)
        postVC.viewTitel = post.title
    }
}
