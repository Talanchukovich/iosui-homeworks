//
//  FeedView.swift
//  Navigation
//
//  Created by Андрей Таланчук on 19.10.2022.
//

import UIKit

class FeedView: UIView {
    
    var completion: ((String)->Void)?
    
    private lazy var buttonStuck: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var postButton1: UIButton = {
        let postButton = UIButton()
        postButton.backgroundColor = .blue
        postButton.tintColor = .white
        postButton.layer.borderWidth = 3
        postButton.layer.borderColor = UIColor.white.cgColor
        postButton.setTitle("Открыть пост1", for: .normal)
        postButton.layer.cornerRadius = 25
        postButton.translatesAutoresizingMaskIntoConstraints = false
        return postButton
    }()
    
    private lazy var postButton2: UIButton = {
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        addTargets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addTargets(){
        postButton1.addTarget(self, action: #selector(actionPostButton), for: .touchUpInside)
        postButton2.addTarget(self, action: #selector(actionPostButton), for: .touchUpInside)
    }
    
    @objc private func actionPostButton(_ sender: UIButton){
        guard let title = sender.currentTitle else {return}
        completion?(title)
    }
    
    private func setView(){
        self.backgroundColor = .lightGray
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonStuck)
        buttonStuck.addArrangedSubview(postButton1)
        buttonStuck.addArrangedSubview(postButton2)
        
        NSLayoutConstraint.activate([
            buttonStuck.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonStuck.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            buttonStuck.heightAnchor.constraint(equalToConstant: 110),
            buttonStuck.widthAnchor.constraint(equalToConstant: 200)])
    }
}
