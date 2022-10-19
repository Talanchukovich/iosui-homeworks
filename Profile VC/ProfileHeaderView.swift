//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Андрей Таланчук on 19.10.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    let contentView = UIView()
    
    private let avatarImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "catImage")
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 3
        image.layer.cornerRadius = 75
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Укажите статус"
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.white.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let setStatusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show status", for: .normal)
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
        contentView.addSubview(avatarImageView)
        contentView.addSubview(fullNameLabel)
        contentView.addSubview(statusLabel)
        contentView.addSubview(statusTextField)
        contentView.addSubview(setStatusButton)
    }
    
    func setLayout(){
        NSLayoutConstraint.activate([avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                                     avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
                                     avatarImageView.widthAnchor.constraint(equalToConstant: 150),
                                     avatarImageView.heightAnchor.constraint(equalToConstant: 150)])
        
        NSLayoutConstraint.activate([fullNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 27),
                                     fullNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)])
        
        NSLayoutConstraint.activate([setStatusButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                                     setStatusButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16),
                                     setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
                                     setStatusButton.heightAnchor.constraint(equalToConstant: 50)])
        
        NSLayoutConstraint.activate([statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
                                     statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: 60)])
        
        NSLayoutConstraint.activate([statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
                                     statusTextField.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor)])   
    }
}
