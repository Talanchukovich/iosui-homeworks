//
//  PhotosCollectionViewModel.swift
//  Navigation
//
//  Created by Андрей Таланчук on 27.10.2022.
//

import UIKit
import StorageService

struct PhotosCollectionViewModel {

    let collectionViewItemCount: CGFloat
    let minimumInteritemSpacing: CGFloat
    let minimumLineSpacing: CGFloat
    let sectionInset: UIEdgeInsets
    let scrollDirection: UICollectionView.ScrollDirection
    
    let photos = Photos().photosName
    let layout = UICollectionViewFlowLayout()
   
    
    init(collectionViewItemCount: CGFloat, minimumInteritemSpacing: CGFloat, minimumLineSpacing: CGFloat, sectionInset: UIEdgeInsets, scrollDirection: UICollectionView.ScrollDirection) {
        self.collectionViewItemCount = collectionViewItemCount
        self.minimumInteritemSpacing = minimumInteritemSpacing
        self.minimumLineSpacing = minimumLineSpacing
        self.sectionInset = sectionInset
        self.scrollDirection = scrollDirection
        self.layout.scrollDirection = scrollDirection
        self.layout.minimumInteritemSpacing = minimumInteritemSpacing
        self.layout.minimumLineSpacing = minimumInteritemSpacing
        self.layout.sectionInset = sectionInset
    }
}
