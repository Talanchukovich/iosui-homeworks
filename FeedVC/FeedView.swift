//
//  FeedView.swift
//  Navigation
//
//  Created by Андрей Таланчук on 19.10.2022.
//

import UIKit

class FeedView: UIView {
    
    var contentView: UIView = {
        var contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
        let postButton: UIButton = {
        let postButton = UIButton()
        postButton.backgroundColor = .blue
        postButton.layer.borderWidth = 3
        postButton.layer.borderColor = UIColor.white.cgColor
        postButton.setTitle("Открыть пост", for: .normal)
        postButton.tintColor = .white
        postButton.layer.cornerRadius = 25
        postButton.translatesAutoresizingMaskIntoConstraints = false
        return postButton
    }()
    
    func addView(){
        contentView.addSubview(postButton)
    }
    
    func setLayout(){
        NSLayoutConstraint.activate([postButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                                     postButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                                     postButton.heightAnchor.constraint(equalToConstant: 50),
                                     postButton.widthAnchor.constraint(equalToConstant: 200)])
    }
}
