//
//  MainViewControllerUIElements.swift
//  Login-FlipgridUITests
//
//  Created by nikilesh balaji on 2/9/22.
//

import Foundation
import XCTest

class MainViewControllerUIElements {
    
    var profileCreationHeaderTextLabel: XCUIElement!
    var profileCreationHelperTextLabel: XCUIElement!
    var firstNameTextField: XCUIElement!
    var emailTextField: XCUIElement!
    var passwordTextField: XCUIElement!
    var websiteTextField: XCUIElement!
    
    var application: XCUIApplication!
    
    init (app: XCUIApplication) {
        application = app
        initializeAllUIElements()
    }
    
    func initializeAllUIElements() {
        profileCreationHeaderTextLabel = application.staticTexts[Utility.localized(Constants.ApplicationContent.profileCreationHeaderText)]
        profileCreationHelperTextLabel = application.staticTexts[Utility.localized(Constants.ApplicationContent.profileCreationHelperText)]
        firstNameTextField = application.textFields[Utility.localized(Constants.ApplicationContent.profileCreationFirstName)]
        emailTextField = application.textFields[Utility.localized(Constants.ApplicationContent.profileCreationEmailAddress)]
        passwordTextField = application.secureTextFields[Utility.localized(Constants.ApplicationContent.profileCreationPassword)]
        websiteTextField = application.textFields[Utility.localized(Constants.ApplicationContent.profileCreationWebsite)]
    }
}
