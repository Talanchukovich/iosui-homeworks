//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Андрей Таланчук on 25.10.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    private var collectionView: UIView
    
    init(collectionView: UIView) {
        self.collectionView = collectionView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
}
