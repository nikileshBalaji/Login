//
//  ConfirmationViewController.swift
//  Login-FlipgridUITests
//
//  Created by nikilesh balaji on 2/9/22.
//

import Foundation
import XCTest

class ConfirmationViewControllerUIElements {
    
    var confirmationHeaderLabel: XCUIElement!
    var confirmationHelperLabel: XCUIElement!
    var userWebsiteTextView: XCUIElement!
    var userNameLabel: XCUIElement!
    var userEmailLabel: XCUIElement!
    
    var application: XCUIApplication!
    var userObject: User!
    
    init (app: XCUIApplication, user: User) {
        application = app
        userObject = user
        initializeAllUIElements()
    }
    
    func initializeAllUIElements() {
        confirmationHeaderLabel = application.staticTexts[Utility.localized(Constants.ApplicationContent.LoginConfirmationHeader).replacingOccurrences(of: "%s", with: userObject.userName ?? "")]
        confirmationHelperLabel = application.staticTexts[Utility.localized(Constants.ApplicationContent.LoginConfirmationHelperText)]
        userWebsiteTextView = application.links[userObject.website.0 ?? ""]
        userNameLabel = application.staticTexts[userObject.userName ?? ""]
        userEmailLabel = application.staticTexts[userObject.emailAddress ?? ""]
    }
}
