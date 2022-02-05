//
//  User.swift
//  Login-Flipgrid
//
//  Created by nikilesh balaji on 2/4/22.
//

import Foundation

struct User {
    
    var userName: String?
    var emailAddress: String?
    var password: String?
    var website: String?
    
    init(name: String, email: String, password: String, website: String) {
        self.userName = name
        self.emailAddress = email
        self.password = password
        self.website = website
    }
}
