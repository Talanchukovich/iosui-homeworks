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
        feedView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
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
