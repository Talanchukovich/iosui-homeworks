//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Андрей Таланчук on 19.10.2022.
//

import UIKit

class ProfileViewController: UIViewController{
   
    var profileHeaderView = ProfileHeaderView()
    private var statusText = "Укажите статус"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpVie()
        profileHeaderView.addView()
        profileHeaderView.setLayout()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeaderView.frame.size = view.frame.size
    }
    
    func setUpVie(){
        view.backgroundColor = .lightGray
        self.navigationItem.title = "Profile"
        view.addSubview(profileHeaderView)
        profileHeaderView.statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        profileHeaderView.setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc func statusTextChanged(_ textField: UITextField){
        guard let text = textField.text else {return}
        statusText = text
    }
    
    @objc func buttonPressed(){
        profileHeaderView.statusLabel.text = statusText
        profileHeaderView.statusTextField.text?.removeAll()
        profileHeaderView.statusTextField.resignFirstResponder()
    }
    
}
