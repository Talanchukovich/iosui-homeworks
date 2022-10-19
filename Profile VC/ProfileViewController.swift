//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Андрей Таланчук on 19.10.2022.
//

import UIKit

class ProfileViewController: UIViewController{
   
    var profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpVie()
        profileHeaderView.addView()
        setLayout()
        profileHeaderView.setLayout()
    }
    
    func setUpVie(){
        view.backgroundColor = .lightGray
        self.navigationItem.title = "Profile"
        view.addSubview(profileHeaderView.contentView)
    }
    
    func setLayout(){
        NSLayoutConstraint.activate([profileHeaderView.contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     profileHeaderView.contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     profileHeaderView.contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     profileHeaderView.contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }
    
}
