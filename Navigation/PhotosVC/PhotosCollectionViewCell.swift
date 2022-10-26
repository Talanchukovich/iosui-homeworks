//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Andrey Talanchuk on 25.10.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    struct Photo {
        var name: String
    }
    
    private lazy var photoImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    
    private func setupView() {
        self.addSubview(photoImageView)
        
        NSLayoutConstraint.activate([
            photoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            photoImageView.topAnchor.constraint(equalTo: self.topAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
    }
    
    func setup(photoName: String) {
        photoImageView.image = UIImage(named: photoName)
    }
}
