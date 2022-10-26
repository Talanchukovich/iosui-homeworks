//
//  PhotoCollectionView.swift
//  Navigation
//
//  Created by Andrey Talanchuk on 26.10.2022.
//

import UIKit

class PhotoCollectionView: UIView {
    
    private lazy var photos = Photos().photosName
    private var scrollDirection: UICollectionView.ScrollDirection?
    private var minimumInteritemSpacing: CGFloat?
    private var minimumLineSpacing: CGFloat?
    private var sectionInset: UIEdgeInsets?
    var collectionViewItemCount: CGFloat?
    lazy var layout: UICollectionViewFlowLayout? = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrollDirection!
        layout.minimumInteritemSpacing = minimumInteritemSpacing!
        layout.minimumLineSpacing = minimumInteritemSpacing!
        layout.sectionInset = sectionInset!
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        guard let layout = layout else {return UICollectionView()}
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotosCollectionViewCell")
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
        
    init(collectionViewItemCount: CGFloat, scrollDirection: UICollectionView.ScrollDirection, minimumInteritemSpacing: CGFloat, minimumLineSpacing: CGFloat, sectionInset: UIEdgeInsets) {
        super.init(frame: .zero)
        self.collectionViewItemCount = collectionViewItemCount
        self.scrollDirection = scrollDirection
        self.minimumInteritemSpacing = minimumInteritemSpacing
        self.minimumLineSpacing = minimumLineSpacing
        self.sectionInset = sectionInset
        self.addSubview(collectionView)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
                                     collectionView.leftAnchor.constraint(equalTo: self.leftAnchor),
                                     collectionView.rightAnchor.constraint(equalTo: self.rightAnchor),
                                     collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCollectionItemHieght(layout: UICollectionViewFlowLayout) -> CGFloat{
        let inset = layout.sectionInset
        let interitemSpacing = layout.minimumLineSpacing
        let width = UIScreen.main.bounds.width - (collectionViewItemCount! - 1) * interitemSpacing - inset.left - inset.right
        let itemWidth = width / collectionViewItemCount!
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
        guard let layout = layout else {return CGSize()}
        let itemWidth = setCollectionItemHieght(layout: layout)
        return CGSize(width: itemWidth, height: itemWidth)
    }
}
