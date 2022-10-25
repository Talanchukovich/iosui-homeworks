//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Андрей Таланчук on 25.10.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private lazy var photosLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.text = "Photos"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var cellAccessoryView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "arrow.right")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        
    }
    
//    let photosCollectionView: UICollectionView = {
//        let view = UICollectionView()
//        return view
//    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell(){
        self.addSubview(photosLabel)
        self.addSubview(cellAccessoryView)
        
        NSLayoutConstraint.activate([
            photosLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            photosLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            
            cellAccessoryView.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            cellAccessoryView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
}
