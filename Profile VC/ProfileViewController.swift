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
    let changeTitleButtton: UIButton = {
        let button = UIButton()
        button.setTitle("Set title", for: .normal)
        button.backgroundColor = .blue
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        addView()
        profileHeaderView.setView()
        setLayout()
        addTargets()
    }
    
    func addView(){
        view.addSubview(profileHeaderView)
        view.addSubview(changeTitleButtton)
    }
    func setView(){
        view.backgroundColor = .lightGray
        self.navigationItem.title = "Profile"
    }
    
    func setLayout(){
        NSLayoutConstraint.activate([profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     profileHeaderView.heightAnchor.constraint(equalToConstant: 220)])
        
        NSLayoutConstraint.activate([changeTitleButtton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     changeTitleButtton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     changeTitleButtton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                                     changeTitleButtton.heightAnchor.constraint(equalToConstant: 50)])
    }
    
    func addTargets(){
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
