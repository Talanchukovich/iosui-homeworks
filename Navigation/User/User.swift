//
//  User.swift
//  Navigation
//
//  Created by Andrey Talanchuk on 09.11.2022.
//

import UIKit

class User {
    
    let login: String
    let fullName: String
    let avatar: UIImage
    let status: String
    
    init(login: String, fullName: String, avatar: UIImage, status: String) {
        self.login = login
        self.fullName = fullName
        self.avatar = avatar
        self.status = status
    }
}
