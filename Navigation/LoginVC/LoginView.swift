//
//  LoginView.swift
//  Navigation
//
//  Created by Andrey Talanchuk on 19.10.2022.
//

import UIKit

class LoginView: UIView {
    
    var delegate: ButtonDelegate?
    
    func free(){
        print(#function)
    }
    
    private let logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let loginStuckView: UIStackView = {
        let stuck = UIStackView()
        stuck.axis = .vertical
        stuck.spacing = 16
        stuck.translatesAutoresizingMaskIntoConstraints = false
        return stuck
    }()
    
    private let authorizationView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.borderWidth = 0.5
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let midelAuthorizationView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 0.2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let loginTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = .black
        textField.autocapitalizationType = .none
        textField.placeholder = "Email or phone"
        textField.backgroundColor = .systemGray6
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.isSecureTextEntry = true
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = .black
        textField.autocapitalizationType = .none
        textField.placeholder = "Password"
        textField.backgroundColor = .systemGray6
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        let image = UIImage(named: "blue-pixel")
        button.setBackgroundImage(image?.alpha(1), for: .normal)
        button.setBackgroundImage(image?.alpha(0.8), for: .selected)
        button.setBackgroundImage(image?.alpha(0.8), for: .highlighted)
        button.setBackgroundImage(image?.alpha(0.8), for: .disabled)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func pushProfileVC(_ sender: UIButton){
        delegate?.onButtonTap(sender: sender)
    }
    
    func setView(){
        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(logoImageView)
        self.addSubview(loginStuckView)
        authorizationView.addSubview(loginTextField)
        authorizationView.addSubview(passwordTextField)
        authorizationView.addSubview(midelAuthorizationView)
        loginStuckView.addArrangedSubview(authorizationView)
        loginStuckView.addArrangedSubview(loginButton)
        
        loginButton.addTarget(self, action: #selector(pushProfileVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
        
            loginStuckView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            loginStuckView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            loginStuckView.heightAnchor.constraint(equalToConstant: 166),
            loginStuckView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
        
            midelAuthorizationView.leadingAnchor.constraint(equalTo: authorizationView.leadingAnchor),
            midelAuthorizationView.trailingAnchor.constraint(equalTo: authorizationView.trailingAnchor),
            midelAuthorizationView.heightAnchor.constraint(equalToConstant: 0.1),
            midelAuthorizationView.topAnchor.constraint(equalTo: authorizationView.topAnchor, constant: 49.75),
            
            loginTextField.leadingAnchor.constraint(equalTo: authorizationView.leadingAnchor, constant: 10),
            loginTextField.trailingAnchor.constraint(equalTo: authorizationView.trailingAnchor),
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            loginTextField.topAnchor.constraint(equalTo: authorizationView.topAnchor),
            
            passwordTextField.leadingAnchor.constraint(equalTo: authorizationView.leadingAnchor, constant: 10),
            passwordTextField.trailingAnchor.constraint(equalTo: authorizationView.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.bottomAnchor.constraint(equalTo: authorizationView.bottomAnchor),
            
            loginButton.heightAnchor.constraint(equalToConstant: 50)])
    }
}

extension UIImage {

    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
