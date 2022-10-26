//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Андрей Таланчук on 25.10.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private lazy var photos = Photos().makePhotosData()
    private lazy var collectionViewItemCount: CGFloat = 4
    private lazy var collectionViewHieght: CGFloat = 0
    
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
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCell")
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        collectionViewHieght = setCollectionItemHieght(layout: layout) + layout.sectionInset.top + layout.sectionInset.bottom
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setCollectionItemHieght(layout: UICollectionViewFlowLayout) -> CGFloat{
        let inset = layout.sectionInset
        let interitemSpacing = layout.minimumLineSpacing
        let width = UIScreen.main.bounds.width - (collectionViewItemCount - 1) * interitemSpacing - inset.left - inset.right
        let itemWidth = width / collectionViewItemCount
        return itemWidth
    }
    
    private func setupCell(){
        self.addSubview(photosLabel)
        self.addSubview(cellAccessoryView)
        self.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            photosLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            photosLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            
            cellAccessoryView.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            cellAccessoryView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: collectionViewHieght)
        ])
    }
}

extension PhotosTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! PhotosCollectionViewCell
        let photo = photos[indexPath.row]
        cell.setup(photoName: photo)
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 8
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = setCollectionItemHieght(layout: layout)
        return CGSize(width: itemWidth, height: itemWidth)
    }
}
