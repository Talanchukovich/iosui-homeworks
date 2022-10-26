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
        addCompletion()
    }
    
    func setView(){
        self.title = "Новости"
        view.addSubview(feedView)
        
        NSLayoutConstraint.activate([
            feedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            feedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            feedView.topAnchor.constraint(equalTo: view.topAnchor),
            feedView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
    
    func addCompletion(){
        feedView.completion = {[weak self] title in
            self?.pushPostVC(title: title)
        }
    }
    
    func pushPostVC(title: String){
        navigationController?.pushViewController(postVC, animated: true)
        postVC.viewTitel = title
    }
}
