//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Андрей Таланчук on 19.10.2022.
//

import UIKit

class ProfileViewController: UIViewController{
    
    var profileHeaderView = ProfileHeaderView()
    private var statusText = "Укажите статус!"
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
        addDelegate()
        addTapGesture()
        setLayout()
        profileHeaderView.setView()
    }
    
    func setView(){
        self.navigationItem.title = "Profile"
        view.backgroundColor = .lightGray
        view.addSubview(profileHeaderView)
        view.addSubview(changeTitleButtton)
    }
    
    func addDelegate(){
        profileHeaderView.delegate = self
        profileHeaderView.statusTextField.delegate = self
    }
    
    func addTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyBoard(){
        self.view.endEditing(true)
    }
    
    func setLayout(){
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
                                     
            changeTitleButtton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            changeTitleButtton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            changeTitleButtton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            changeTitleButtton.heightAnchor.constraint(equalToConstant: 50)])
    }
    
    private func setStatusLabel(){
        profileHeaderView.setStatusLabel(statusText: statusText)
    }
}

extension ProfileViewController: ButtonDelegate {
    
    func onButtonTap(sender: UIButton) {
        view.endEditing(true)
        setStatusLabel()
    }
}

extension ProfileViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else {return}
        statusText = text
       
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField.text?.isEmpty == false {
            setStatusLabel()
        }
        return true
    }
}
