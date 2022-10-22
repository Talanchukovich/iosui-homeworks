//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Андрей Таланчук on 19.10.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let avatarImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "catImage")
        image.contentMode = .scaleAspectFill
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 3
        image.layer.cornerRadius = 50
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Hipster Cat"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Укажите статус"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     let statusTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Укажите статус"
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.borderStyle = .roundedRect
        textField.clipsToBounds = true
        textField.layer.borderColor = UIColor.black.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let setStatusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show status", for: .normal)
        button.backgroundColor = .blue
        button.tintColor = .white
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func addView(){
        self.addSubview(avatarImageView)
        self.addSubview(fullNameLabel)
        self.addSubview(statusLabel)
        self.addSubview(statusTextField)
        self.addSubview(setStatusButton)
    }
    
    func setLayout(){
        NSLayoutConstraint.activate([avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
                                     avatarImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
                                     avatarImageView.widthAnchor.constraint(equalToConstant: 100),
                                     avatarImageView.heightAnchor.constraint(equalToConstant: 100)])
        
        NSLayoutConstraint.activate([fullNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
                                     fullNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)])
        
        NSLayoutConstraint.activate([setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
                                     setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
                                     setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
                                     setStatusButton.heightAnchor.constraint(equalToConstant: 50)])
        
        NSLayoutConstraint.activate([statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
                                     statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -60)])

        NSLayoutConstraint.activate([statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
                                     statusTextField.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
                                     statusTextField.trailingAnchor.constraint(equalTo: setStatusButton.trailingAnchor),
                                     statusTextField.heightAnchor.constraint(equalToConstant: 40)])
    }
}
