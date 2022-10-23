//
//  FeedView.swift
//  Navigation
//
//  Created by Андрей Таланчук on 19.10.2022.
//

import UIKit

class FeedView: UIView {
   
    var delegate: ButtonDelegate?
    private let buttonStuck: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let postButton1: UIButton = {
        let postButton = UIButton()
        postButton.backgroundColor = .blue
        postButton.layer.borderWidth = 3
        postButton.layer.borderColor = UIColor.white.cgColor
        postButton.setTitle("Открыть пост1", for: .normal)
        postButton.tintColor = .white
        postButton.layer.cornerRadius = 25
        postButton.translatesAutoresizingMaskIntoConstraints = false
        return postButton
    }()
    
    private let postButton2: UIButton = {
        let postButton = UIButton()
        postButton.backgroundColor = .blue
        postButton.layer.borderWidth = 3
        postButton.layer.borderColor = UIColor.white.cgColor
        postButton.setTitle("Открыть пост2", for: .normal)
        postButton.tintColor = .white
        postButton.layer.cornerRadius = 25
        postButton.translatesAutoresizingMaskIntoConstraints = false
        return postButton
    }()
    
    
    private func setLayout(){
        NSLayoutConstraint.activate([
            buttonStuck.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonStuck.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            buttonStuck.heightAnchor.constraint(equalToConstant: 110),
            buttonStuck.widthAnchor.constraint(equalToConstant: 200)])
    }
    
    private func addTargets(){
        postButton1.addTarget(self, action: #selector(actionPostButton), for: .touchUpInside)
        postButton2.addTarget(self, action: #selector(actionPostButton), for: .touchUpInside)
    }
    
    @objc private func actionPostButton(_ sender: UIButton){
        delegate?.onButtonTap(sender: sender)
    }
    
    func setView(){
        self.backgroundColor = .lightGray
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonStuck)
        buttonStuck.addArrangedSubview(postButton1)
        buttonStuck.addArrangedSubview(postButton2)
        setLayout()
        addTargets()
    }
}
