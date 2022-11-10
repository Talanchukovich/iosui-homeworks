//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Andrey Talanchuk on 25.10.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    struct PhotoViewModel {
        var name: String
    }
    
    private lazy var photoImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
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
        
        photoImageView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
    
    func setupViewModel(viewModel: PhotoViewModel) {
        photoImageView.image = UIImage(named: viewModel.name)
    }
}
