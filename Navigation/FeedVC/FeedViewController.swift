//
//  FeedViewController.swift
//  Navigation
//
//  Created by Андрей Таланчук on 19.10.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    var feedView = FeedView()
    var postVC = PostViewController()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        addDelegate()
        setLayout()
    }
    
    func setView(){
        self.title = "Новости"
        view.addSubview(feedView)
        feedView.setView()
    }
    
    func addDelegate(){
        feedView.delegate = self
    }
    
    func setLayout(){
        NSLayoutConstraint.activate([
            feedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            feedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            feedView.topAnchor.constraint(equalTo: view.topAnchor),
            feedView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
}

extension FeedViewController: ButtonDelegate {
    func onButtonTap(sender: UIButton) {
        navigationController?.pushViewController(postVC, animated: true)
        postVC.viewTitel = sender.currentTitle
    }
}

