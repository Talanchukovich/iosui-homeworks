//
//  PostViewController.swift
//  Navigation
//
//  Created by Андрей Таланчук on 19.10.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var viewTitel: String?
    let infoVC = InfoViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpView()
    }
    
    func setUpView(){
        guard let title = viewTitel else {return}
        self.title = title
        view.backgroundColor = .cyan
        setupBarButtonItem()
    }
    
    func setupBarButtonItem(){
        let barButton = UIBarButtonItem(image: UIImage(systemName: "folder"), style: .plain, target: self, action: #selector(barButtonAction))
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func barButtonAction(){
        navigationController?.present(infoVC, animated: true)
    }
}
