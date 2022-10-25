//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Андрей Таланчук on 25.10.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    private lazy var photos = Photos().makePhotosData()
    private lazy var itemCount: CGFloat = 2
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Photo Gallery"
    }

    private func setupView() {
        view.backgroundColor = .systemGray6
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! PhotosCollectionViewCell
        let photo = photos[indexPath.row]
        cell.setup(photoName: photo)
        cell.clipsToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let inset = layout.sectionInset
        let interitemSpacing = layout.minimumInteritemSpacing
        let width = UIScreen.main.bounds.width - (itemCount - 1) * interitemSpacing - inset.left - inset.right
        let itemWidth = width / itemCount
        return CGSize(width: itemWidth, height: itemWidth)
    }

    
    
    
    
//    private lazy var photos = Photos().makePhotosData()
//
//    private lazy var layout: UICollectionViewFlowLayout = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        layout.minimumLineSpacing = 20
//        layout.minimumInteritemSpacing = 10
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 17, bottom: 0, right: 16)
//        return layout
//    }()
//
//    private lazy var photosCollectionView: UICollectionView = {
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        //collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotosCollectionViewCell")
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
//        collectionView.backgroundColor = .white
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        return collectionView
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupView()
//        setupNavigationBar()
//    }
//        private func setupNavigationBar() {
//            //navigationController?.navigationBar.prefersLargeTitles = true
//            navigationController?.title = "Photo Gallery"
//        }
//
//    private func setupView(){
//        view.backgroundColor = .systemBackground
//        view.addSubview(photosCollectionView)
//
//        NSLayoutConstraint.activate([
//            photosCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            photosCollectionView.topAnchor.constraint(equalTo: view.bottomAnchor),
//            photosCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            photosCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//    }
//}
//
//extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print("Done")
//       return 10
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
//        cell.layer.cornerRadius = 8
//        cell.clipsToBounds = true
//        cell.backgroundColor = .systemYellow
//        return cell
//    }
//
//
}
