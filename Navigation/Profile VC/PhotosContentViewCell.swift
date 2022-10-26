//
//  PhotosContentViewCell.swift
//  Navigation
//
//  Created by Андрей Таланчук on 25.10.2022.
//

import UIKit

class PhotosContentViewCell: UITableViewCell {
    
    private let photos = Photos().photosName
    private lazy var collectionViewItemCount: CGFloat = 4
    lazy var collectionViewHieght: CGFloat = setCollectionItemHieght(layout: layout) + layout.sectionInset.top + layout.sectionInset.top
    
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
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotosCollectionViewCell")
        collectionView.backgroundColor = .white
        collectionView.isScrollEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
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
    
    func setupView() {
        self.addSubview(photosLabel)
        self.addSubview(cellAccessoryView)
        self.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.heightAnchor.constraint(equalToConstant: collectionViewHieght),
            collectionView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])
    }
}

extension PhotosContentViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCollectionViewCell", for: indexPath) as? PhotosCollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCollectionViewCell", for: indexPath)
            return cell
        }
        let photo = photos[indexPath.row]
        cell.setup(photoName: photo)
        cell.clipsToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = setCollectionItemHieght(layout: collectionViewLayout as! UICollectionViewFlowLayout)
        return CGSize(width: itemWidth, height: itemWidth)
    }
}
