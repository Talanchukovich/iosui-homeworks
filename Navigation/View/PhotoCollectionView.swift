//
//  PhotoCollectionView.swift
//  Navigation
//
//  Created by Andrey Talanchuk on 26.10.2022.
//

import UIKit

class PhotoCollectionView: UICollectionView {
    
    private var photos: [String]
    private var layout: UICollectionViewFlowLayout
    private var collectionViewItemCount: CGFloat
    
    init(viewStruct: PhotosCollectionViewModel) {
        self.photos = viewStruct.photos
        self.layout = viewStruct.layout
        self.collectionViewItemCount = viewStruct.collectionViewItemCount
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotosCollectionViewCell")
        self.backgroundColor = .white
        self.delegate = self
        self.dataSource = self
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCollectionItemHieght(layout: UICollectionViewFlowLayout) -> CGFloat{
        let inset = layout.sectionInset
        let interitemSpacing = layout.minimumLineSpacing
        let width = UIScreen.main.bounds.width - (collectionViewItemCount - 1) * interitemSpacing - inset.left - inset.right
        let itemWidth = width / collectionViewItemCount
        return itemWidth
    }
}

extension PhotoCollectionView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCollectionViewCell", for: indexPath) as! PhotosCollectionViewCell
        let photo = photos[indexPath.row]
        let photoViewModel = PhotosCollectionViewCell.PhotoViewModel(name: photo)
        cell.setupViewModel(viewModel: photoViewModel)
        cell.clipsToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = setCollectionItemHieght(layout: layout)
        return CGSize(width: itemWidth, height: itemWidth)
    }
}
