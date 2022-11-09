//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Andrey Talanchuk on 23.10.2022.
//

import UIKit
import iOSIntPackage

class PostTableViewCell: UITableViewCell {
    
    struct PostViewModel {
        let author: String
        let description: String
        let imagePost: String
        let likes: Int
        let views: Int
        let indexPath: IndexPath
    }
    private lazy var likes = "Likes: "
    private lazy var views = "Views: "
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var imagePostView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()
    private lazy var viewsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
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
    
    func setupVieModel(viewModel: PostViewModel){
        authorLabel.text = viewModel.author
        let image = UIImage(named: viewModel.imagePost)
        let errorImage = UIImage(systemName: "")
        let index = viewModel.indexPath.row
        if index % 2 == 0 {
            ImageProcessor().processImage(sourceImage: image ?? errorImage!, filter: .bloom(intensity: 2)) { image in
                imagePostView.image = image
            }
        }else {imagePostView.image = image}
    
        descriptionLabel.text = viewModel.description
        likesLabel.text = likes.appending(String(viewModel.likes))
        viewsLabel.text = views.appending(String(viewModel.views))
    }
    
    private func setupCell(){
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 0.2
        self.addSubview(authorLabel)
        self.addSubview(imagePostView)
        self.addSubview(descriptionLabel)
        self.addSubview(likesLabel)
        self.addSubview(viewsLabel)
        
        authorLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).inset(16)
            make.leading.equalTo(self.snp.leading).inset(16)
            make.trailing.equalTo(self.snp.trailing).inset(16)
        }
        
        imagePostView.snp.makeConstraints { make in
            make.top.equalTo(authorLabel.snp.bottom).inset(-16)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.height.equalTo(self.bounds.width)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(imagePostView.snp.bottom).inset(-16)
            make.leading.equalTo(self.snp.leading).inset(16)
            make.trailing.equalTo(self.snp.trailing).inset(16)
        }
        
        likesLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).inset(-16)
            make.leading.equalTo(self.snp.leading).inset(16)
            make.bottom.equalTo(self.snp.bottom).inset(16)
        }
        
        viewsLabel.snp.makeConstraints { make in
            make.trailing.equalTo(self.snp.trailing).inset(16)
            make.firstBaseline.equalTo(likesLabel.snp.firstBaseline)
        }
    }
}
