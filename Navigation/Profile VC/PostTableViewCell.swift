//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Andrey Talanchuk on 23.10.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    struct CellPost {
        let author: String
        let description: String
        let imagePost: String
        let likes: Int
        let views: Int
        let indexPath: IndexPath
    }
    
    lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var imagePostView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = .max
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var viewsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var indexPath: IndexPath?
    
    private lazy var likes = "Likes: "
    private lazy var views = "Views: "
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        authorLabel.text = nil
        imagePostView.image = nil
        descriptionLabel.text = nil
        likesLabel.text = nil
        viewsLabel.text = nil
    }
    
    func setup(cellPost: CellPost){
        authorLabel.text = cellPost.author
        imagePostView.image = UIImage(named: cellPost.imagePost)
        descriptionLabel.text = cellPost.description
        likesLabel.text = likes.appending(String(cellPost.likes))
        viewsLabel.text = views.appending(String(cellPost.views)) 
        indexPath = cellPost.indexPath
    }
    
    private func setupView(){
        self.addSubview(authorLabel)
        self.addSubview(imagePostView)
        self.addSubview(descriptionLabel)
        self.addSubview(likesLabel)
        self.addSubview(viewsLabel)
        
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            authorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            imagePostView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 16),
            imagePostView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imagePostView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imagePostView.heightAnchor.constraint(equalToConstant: self.bounds.width),
            
            descriptionLabel.topAnchor.constraint(equalTo: imagePostView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            likesLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            
            viewsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            viewsLabel.firstBaselineAnchor.constraint(equalTo: likesLabel.firstBaselineAnchor)
            ])
    }
}
