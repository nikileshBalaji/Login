//
//  Login_FlipgridUITests.swift
//  Login-FlipgridUITests
//
//  Created by nikilesh balaji on 2/3/22.
//

import XCTest

class Login_FlipgridUITests: XCTestCase {

    var mainViewControllerUIElements: MainViewControllerUIElements!
    var confirmationViewControllerUIElements: ConfirmationViewControllerUIElements!
    var dummyUser = User(name: "Nikilesh", email: "nbalaji@syr.edu",
                         password: "6204161718#Wel", website: "https://www.linkedin.com/in/nikileshb/")!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    override func setUp() {
        super.setUp()
    }
    
    func testBasicFlow() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        mainViewControllerUIElements = MainViewControllerUIElements(app: app)
        
        mainViewControllerUIElements.firstNameTextField.tap()
        mainViewControllerUIElements.firstNameTextField.typeText(dummyUser.userName ?? "")
        XCUIApplication().keyboards.buttons["return"].tap()
        
        mainViewControllerUIElements.emailTextField.tap()
        mainViewControllerUIElements.emailTextField.typeText(dummyUser.emailAddress ?? "")
        XCUIApplication().keyboards.buttons["return"].tap()
        
        mainViewControllerUIElements.websiteTextField.tap()
        mainViewControllerUIElements.websiteTextField.typeText(dummyUser.website.0 ?? "")
        XCUIApplication().keyboards.buttons["return"].tap()
        
        mainViewControllerUIElements.passwordTextField.tap()
        mainViewControllerUIElements.passwordTextField.typeText("6204161718#Wel")
        XCUIApplication().keyboards.buttons["return"].tap()
        
        XCTAssertEqual(mainViewControllerUIElements.profileCreationHeaderTextLabel.label , Utility.localized(Constants.ApplicationContent.profileCreationHeaderText))
        XCTAssertEqual(mainViewControllerUIElements.profileCreationHelperTextLabel.label , Utility.localized(Constants.ApplicationContent.profileCreationHelperText))
        
        app.buttons[Utility.localized(Constants.ApplicationContent.submitButton)].tap()
        
        confirmationViewControllerUIElements = ConfirmationViewControllerUIElements(app: app, user: dummyUser)
        
        let collatedText = Utility.localized(Constants.ApplicationContent.LoginConfirmationHeader).replacingOccurrences(of: "%s", with: dummyUser.userName ?? "")
        
        XCTAssertEqual(confirmationViewControllerUIElements.confirmationHeaderLabel.label, collatedText, "No Header")
        
        XCTAssertEqual(confirmationViewControllerUIElements.confirmationHelperLabel.label , Utility.localized(Constants.ApplicationContent.LoginConfirmationHelperText), "Confirmation Helper text missing")
        
        XCTAssertEqual(confirmationViewControllerUIElements.userEmailLabel.label, dummyUser.emailAddress!, "ConfirmationVC NO Email")
        
        XCTAssertEqual(confirmationViewControllerUIElements.userNameLabel.label, dummyUser.userName!, "ConfirmationVC NO Name")
        
        app.buttons[Utility.localized(Constants.ApplicationContent.signIn)].tap()
        app.buttons[Utility.localized(Constants.ApplicationContent.submitButton)].tap()
    }
    
    
    func testWhenUserClicksSubmitsBeforeEnteringInformation() {
        let app = XCUIApplication()
        app.launch()
        
        mainViewControllerUIElements = MainViewControllerUIElements(app: app)
        
        app.buttons[Utility.localized(Constants.ApplicationContent.submitButton)].tap()
        app.buttons[Utility.localized(Constants.ApplicationContent.alertAction)].tap()
        
        mainViewControllerUIElements.firstNameTextField.tap()
        mainViewControllerUIElements.firstNameTextField.typeText(dummyUser.userName ?? "")
        XCUIApplication().keyboards.buttons["return"].tap()
        
        app.buttons[Utility.localized(Constants.ApplicationContent.submitButton)].tap()
        app.buttons[Utility.localized(Constants.ApplicationContent.alertAction)].tap()
        
        mainViewControllerUIElements.emailTextField.tap()
        mainViewControllerUIElements.emailTextField.typeText(dummyUser.emailAddress ?? "")
        XCUIApplication().keyboards.buttons["return"].tap()
        
        app.buttons[Utility.localized(Constants.ApplicationContent.submitButton)].tap()
        app.buttons[Utility.localized(Constants.ApplicationContent.alertAction)].tap()
        
        mainViewControllerUIElements.websiteTextField.tap()
        mainViewControllerUIElements.websiteTextField.typeText(dummyUser.website.0 ?? "")
        XCUIApplication().keyboards.buttons["return"].tap()
        
        app.buttons[Utility.localized(Constants.ApplicationContent.submitButton)].tap()
        app.buttons[Utility.localized(Constants.ApplicationContent.alertAction)].tap()
        
        mainViewControllerUIElements.passwordTextField.tap()
        mainViewControllerUIElements.passwordTextField.typeText("6204161718#Wel")
        XCUIApplication().keyboards.buttons["return"].tap()
        
        app.buttons[Utility.localized(Constants.ApplicationContent.submitButton)].tap()
        app.buttons[Utility.localized(Constants.ApplicationContent.signIn)].tap()
    }
    
}
