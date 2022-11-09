//
//  TestUserService.swift
//  Navigation
//
//  Created by Andrey Talanchuk on 09.11.2022.
//

import UIKit

class TestUserService: UserService {
    
    private let testUser1 = User(login: "test1", fullName: "Test User Cat", avatar: UIImage(named: "cat") ?? UIImage(systemName: "")!, status: "Testing Cat User")
    
    private let testUser2 = User(login: "test2", fullName: "Test User Dog", avatar: UIImage(named: "dog") ?? UIImage(systemName: "")!, status: "Testing Dog User")
    
    func checkLogin(login: String) -> User? {
        let users = [testUser1, testUser2]
        for user in users {
            if user.login == login {
                return user
            }
        }
        return nil
    }
    
    
}
