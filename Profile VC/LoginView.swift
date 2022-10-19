//
//  LoginView.swift
//  Navigation
//
//  Created by Andrey Talanchuk on 19.10.2022.
//

import UIKit

class LoginView: UIView {
    
    private let logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let loginStuckView: UIStackView = {
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
        textField.font = UIFont(name: "systemFont", size: 16)
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
        textField.font = UIFont(name: "systemFont", size: 16)
        textField.textColor = .black
        textField.autocapitalizationType = .none
        textField.placeholder = "Password"
        textField.backgroundColor = .systemGray6
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 15.0, *) {
            button.configurationUpdateHandler = {button in
                switch button.state {
                case .normal:
                    button.configuration?.background.backgroundColor = .blue.withAlphaComponent(1)
                    button.configuration?.title = "Log In"
                case .selected:
                    button.configuration?.background.backgroundColor = .blue.withAlphaComponent(0.8)
                    button.configuration?.title = "Log In"
                case .highlighted:
                    button.configuration?.background.backgroundColor = .blue.withAlphaComponent(0.8)
                    button.configuration?.title = "Log In"
                case .disabled:
                    button.configuration?.background.backgroundColor = .blue.withAlphaComponent(1)
                    button.configuration?.title = "Log In"
                default:
                    button.configuration?.background.backgroundColor = .blue.withAlphaComponent(1)
                    button.configuration?.title = "Log In"
                }
                
            }
        } else {
            // Fallback on earlier versions
        }
        return button
    }()
    
    private func addView(){
        self.addSubview(logoImageView)
        self.addSubview(loginStuckView)
        authorizationView.addSubview(loginTextField)
        authorizationView.addSubview(passwordTextField)
        authorizationView.addSubview(midelAuthorizationView)
        loginStuckView.addArrangedSubview(authorizationView)
        loginStuckView.addArrangedSubview(loginButton)
    }
    
    private func setLayout(){
        NSLayoutConstraint.activate([logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                                     logoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
                                     logoImageView.widthAnchor.constraint(equalToConstant: 100),
                                     logoImageView.heightAnchor.constraint(equalToConstant: 100)])
        
        NSLayoutConstraint.activate([loginStuckView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
                                     loginStuckView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
                                     loginStuckView.heightAnchor.constraint(equalToConstant: 166),
                                     loginStuckView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120)])
        
        NSLayoutConstraint.activate([midelAuthorizationView.leadingAnchor.constraint(equalTo: authorizationView.leadingAnchor),
                                     midelAuthorizationView.trailingAnchor.constraint(equalTo: authorizationView.trailingAnchor),
                                     midelAuthorizationView.heightAnchor.constraint(equalToConstant: 0.1),
                                     midelAuthorizationView.topAnchor.constraint(equalTo: authorizationView.topAnchor, constant: 49.75)])
        
        NSLayoutConstraint.activate([loginTextField.leadingAnchor.constraint(equalTo: authorizationView.leadingAnchor, constant: 10),
                                     loginTextField.trailingAnchor.constraint(equalTo: authorizationView.trailingAnchor),
                                     loginTextField.heightAnchor.constraint(equalToConstant: 50),
                                     loginTextField.topAnchor.constraint(equalTo: authorizationView.topAnchor)])
        
        NSLayoutConstraint.activate([passwordTextField.leadingAnchor.constraint(equalTo: authorizationView.leadingAnchor, constant: 10),
                                     passwordTextField.trailingAnchor.constraint(equalTo: authorizationView.trailingAnchor),
                                     passwordTextField.heightAnchor.constraint(equalToConstant: 50),
                                     passwordTextField.bottomAnchor.constraint(equalTo: authorizationView.bottomAnchor)])
        
        NSLayoutConstraint.activate([loginButton.heightAnchor.constraint(equalToConstant: 50)])
    }
    
    func setView(){
        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
        addView()
        setLayout()
    }

}
