//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Андрей Таланчук on 19.10.2022.
//

import UIKit

class ProfileViewController: UIViewController{
    
    private var posts = Posts().setPosts()
    private var profileHeaderView = ProfileHeaderView()
    
    private lazy var postsTableView: UITableView = {
      let tableView = UITableView()
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "ProfileHeaderView")
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        addDelegate()
    }
    
    func setView(){
        view.addSubview(postsTableView)
        view.backgroundColor = .lightGray
        
        NSLayoutConstraint.activate([
            postsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            postsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            postsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
    }
    
    func addDelegate(){
        postsTableView.delegate = self
        postsTableView.dataSource = self
        profileHeaderView.statusTextField.delegate = self
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = postsTableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as? PostTableViewCell else {
            let cell = postsTableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath)
            return cell
        }
        let post = posts[indexPath.row]
        let viewModel = PostTableViewCell.CellPost(author: post.author,
                                                   description: post.description,
                                                   imagePost: post.imagePost,
                                                   likes: post.likes,
                                                   views: post.views,
                                                   indexPath: indexPath)
        cell.setup(cellPost: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let profileHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ProfileHeaderView") as? ProfileHeaderView else {
            return nil
        }
        return profileHeaderView
    }
}

extension ProfileViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
//        guard let text = textField.text else {return}
//        ProfileHeaderView().statusLabel.text = !text.isEmpty ? text : ProfileHeaderView().statusLabel.text
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Done")
        textField.resignFirstResponder()
        return true
    }
}
