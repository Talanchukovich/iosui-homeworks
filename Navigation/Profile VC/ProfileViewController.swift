//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Андрей Таланчук on 19.10.2022.
//

import UIKit

class ProfileViewController: UIViewController{
    private let photosContentViewCell = PhotosContentViewCell()
    private let posts = Posts().setPosts()
    private lazy var statusText = ""
    
    private lazy var postsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "ProfileHeaderView")
        tableView.register(PhotosContentViewCell.self, forCellReuseIdentifier: "PhotosContentViewCell")
        tableView.backgroundColor = .lightGray
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = CGFloat(0)
        }
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        addDelegate()
        addTapGesture()
    }
    
    func setView(){
        view.backgroundColor = .lightGray
        view.addSubview(postsTableView)
        
        NSLayoutConstraint.activate([
            postsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            postsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            postsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
    }
    
    func addDelegate(){
        postsTableView.delegate = self
        postsTableView.dataSource = self
    }
    
    func addTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyBoard(){
        self.view.endEditing(true)
    }
    
    func updateHeaderView(text: String) {
        if text.isEmpty == false {
            if let headerView = postsTableView.headerView(forSection: 0) as? ProfileHeaderView {
                headerView.statusLabel.text = text
                headerView.statusTextField.text?.removeAll()
            }
        }
    }
    
    @objc func pushPhotosVC(){
        let photosViewController = PhotosViewController()
        navigationController?.pushViewController(photosViewController, animated: true)
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return posts.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let photoCell = postsTableView.dequeueReusableCell(withIdentifier: "PhotosContentViewCell", for: indexPath) as? PhotosContentViewCell else {
            let cell = postsTableView.dequeueReusableCell(withIdentifier: "PhotosContentViewCell", for: indexPath)
            return cell
        }
        photoCell.contentView.addSubview(photoCell.collectionView)
        photoCell.contentView.addSubview(photoCell.photosLabel)
        photoCell.contentView.addSubview(photoCell.cellAccessoryView)
        photoCell.clipsToBounds = true
        photoCell.contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pushPhotosVC)))
        
        NSLayoutConstraint.activate([
            photoCell.photosLabel.leadingAnchor.constraint(equalTo: photoCell.contentView.leadingAnchor, constant: 12),
            photoCell.photosLabel.topAnchor.constraint(equalTo: photoCell.contentView.topAnchor, constant: 12),
            
            photoCell.cellAccessoryView.centerYAnchor.constraint(equalTo: photoCell.photosLabel.centerYAnchor),
            photoCell.cellAccessoryView.trailingAnchor.constraint(equalTo: photoCell.contentView.trailingAnchor, constant: -12),
            
            photoCell.collectionView.topAnchor.constraint(equalTo: photoCell.photosLabel.bottomAnchor),
            photoCell.collectionView.trailingAnchor.constraint(equalTo: photoCell.contentView.trailingAnchor),
            photoCell.collectionView.leadingAnchor.constraint(equalTo: photoCell.contentView.leadingAnchor),
            photoCell.collectionView.bottomAnchor.constraint(equalTo: photoCell.contentView.bottomAnchor)
            ])
        
        guard let postCell = postsTableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as? PostTableViewCell else {
            let cell = postsTableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath)
            return cell
        }
        let post = posts[indexPath.row]
        let viewModel = PostTableViewCell.ViewModel(author: post.author,
                                                   description: post.description,
                                                   imagePost: post.imagePost,
                                                   likes: post.likes,
                                                   views: post.views,
                                                   indexPath: indexPath)
        postCell.setup(cellPost: viewModel)
        
        switch indexPath.section {
        case 0:
            return photoCell
        default:
            return postCell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let profileHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ProfileHeaderView") as? ProfileHeaderView else {
            return nil
        }
        profileHeaderView.statusTextField.delegate = self
        profileHeaderView.completion = {[weak self] in
            guard let text = self?.statusText else {return}
            self?.hideKeyBoard()
            self?.updateHeaderView(text: text)
        }
        switch section {
        case 0:
            return profileHeaderView
        default:
            return nil
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return tableView.sectionHeaderHeight
        }
        return 8
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        postsTableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ProfileViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else {return}
        statusText = text
        updateHeaderView(text: text)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return string.first == " " ? false : true
    }
    
}
