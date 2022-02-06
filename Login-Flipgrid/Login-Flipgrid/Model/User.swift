//
//  User.swift
//  Login-Flipgrid
//
//  Created by nikilesh balaji on 2/4/22.
//

import Foundation

class User {
    
    private var password: String?
    var userName: String?
    var emailAddress: String?
    var website: (String?, Bool?)
    
    init?(name: String?, email: String?, password: String?, website: String?) {
        if !verify(userName: name, userEmail: email, userPassword: password, userWebsite: website) {
            return nil
        }
        self.userName = name
        self.emailAddress = email
        self.password = password
        self.website = updatewebsiteURL(website: website)
    }
    
    
    /// verify the User information
    /// - Parameters:
    ///   - userName: userName
    ///   - userEmail: user Email
    ///   - userPassword: userPassword
    ///   - userWebsite: userWebsite
    /// - Returns: return if user is valid else false
    private func verify(userName: String?, userEmail: String?, userPassword: String?, userWebsite: String?) -> Bool {
        guard let name = userName, !name.isEmpty,
              let email = userEmail, !email.isEmpty,
              let password = userPassword, !password.isEmpty,
              let website = userWebsite, !website.isEmpty, !website.contains(" ") else {
                  return false
              }
        return true
    }
    
    
    /// add https:// if the supplied is missing it
    /// - Parameter website: website URL
    /// - Returns: final user URL and informing if user had given URL with http, used while showing data in confirmation page
    private func updatewebsiteURL(website: String?) -> (String?,Bool?) {
        if let userSite = website ,
           (!userSite.contains("http://") && !userSite.contains("https://")) {
            return ("https://" + userSite, true)
        }
        return (website, false)
    }
    
}
