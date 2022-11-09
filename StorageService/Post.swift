//
//  Post.swift
//  Navigation
//
//  Created by Андрей Таланчук on 19.10.2022.
//

import Foundation

public struct Post {
    public var title: String
    public var author: String
    public var description: String
    public var imagePost: String
    public var likes: Int
    public var views: Int
    
    public init(title: String, author: String, description: String, imagePost: String, likes: Int, views: Int) {
        self.title = title
        self.author = author
        self.description = description
        self.imagePost = imagePost
        self.likes = likes
        self.views = views
    }
}
