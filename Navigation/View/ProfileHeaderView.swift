//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Андрей Таланчук on 19.10.2022.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    var completion: (()->Void)?
    
    private lazy var avatarImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "catImage")
        image.contentMode = .scaleAspectFill
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 3
        image.layer.cornerRadius = 50
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Hipster Cat"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Укажите статус"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        return label
    }()
    
    lazy var statusTextField: UITextField = {
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
        return textField
    }()
    
    private lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show status", for: .normal)
        button.backgroundColor = .blue
        button.tintColor = .white
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        return button
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setView()
        addTargets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addTargets(){
        setStatusButton.addTarget(self, action: #selector(onButtonTap) , for: .touchUpInside)
    }
    
    @objc private func onButtonTap(){
        completion?()
    }
    
    private func setView(){
        self.contentView.backgroundColor = .systemGray6
        self.contentView.layer.borderColor = UIColor.gray.cgColor
        self.contentView.layer.borderWidth = 0.3
        self.addSubview(avatarImageView)
        self.addSubview(fullNameLabel)
        self.addSubview(statusLabel)
        self.addSubview(statusTextField)
        self.addSubview(setStatusButton)
        
        avatarImageView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(16)
            make.leading.equalTo(self.snp.leading).offset(16)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        
        fullNameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(27)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        setStatusButton.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(16)
            make.leading.equalTo(self.snp.leading).offset(16)
            make.trailing.equalTo(self.snp.trailing).offset(-16)
            make.bottom.equalTo(self.snp.bottom).offset(-16)
            make.height.equalTo(50)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.leading.equalTo(fullNameLabel.snp.leading)
            make.bottom.equalTo(setStatusButton.snp.top).offset(-60)
        }
        
        statusTextField.snp.makeConstraints { make in
            make.top.equalTo(statusLabel.snp.bottom).offset(10)
            make.leading.equalTo(statusLabel.snp.leading)
            make.trailing.equalTo(setStatusButton.snp.trailing)
            make.height.equalTo(40)
        }
    }
}
