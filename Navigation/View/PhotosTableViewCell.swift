//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Andrey Talanchuk on 26.10.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private lazy var sectionInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    private lazy var contentViewStruct = PhotosCollectionViewModel(collectionViewItemCount: 4, minimumInteritemSpacing: 8,
                                                                    minimumLineSpacing: 8, sectionInset: sectionInset,
                                                                    scrollDirection: .horizontal)
    private lazy var collectionView = PhotoCollectionView(viewStruct: contentViewStruct)
    
    lazy var collectionViewHieght: CGFloat = collectionView.setCollectionItemHieght(layout: contentViewStruct.layout) + sectionInset.top + sectionInset.top
    
    lazy var photosLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.text = "Photos"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var cellAccessoryView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "arrow.right")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.layer.borderWidth = 0.3
        self.layer.borderColor = UIColor.gray.cgColor
        self.contentView.addSubview(photosLabel)
        self.contentView.addSubview(cellAccessoryView)
        self.contentView.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            
            photosLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12),
            photosLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12),
            
            cellAccessoryView.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            cellAccessoryView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12),
            
            collectionView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
            collectionView.heightAnchor.constraint(equalToConstant: collectionViewHieght),
            collectionView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])
    }
}

