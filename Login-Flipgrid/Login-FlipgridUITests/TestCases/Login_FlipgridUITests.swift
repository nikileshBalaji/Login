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
                         password: "6204161718#Wel", website: "https://www.linkedin.com/in/nikileshb")!
    
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
        dismissKeyboardIfPresent(app)
        
        mainViewControllerUIElements.emailTextField.tap()
        mainViewControllerUIElements.emailTextField.typeText(dummyUser.emailAddress ?? "")
        dismissKeyboardIfPresent(app)
        
        XCUIDevice.shared.orientation = .landscapeRight
        
        mainViewControllerUIElements.websiteTextField.tap()
        mainViewControllerUIElements.websiteTextField.typeText(dummyUser.website.0 ?? "")
        dismissKeyboardIfPresent(app)
        
        mainViewControllerUIElements.passwordTextField.tap()
        mainViewControllerUIElements.passwordTextField.typeText("6204161718#Wel")
        dismissKeyboardIfPresent(app)
        
        XCUIDevice.shared.orientation = .portrait
        
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
        
        XCUIDevice.shared.orientation = .landscapeRight
        sleep(1)
        app.buttons[Utility.localized(Constants.ApplicationContent.submitButton)].tap()
        XCUIDevice.shared.orientation = .portrait
        
    }
    
    
    func testWhenUserClicksSubmitsBeforeEnteringInformation() {
        let app = XCUIApplication()
        app.launch()
        
        mainViewControllerUIElements = MainViewControllerUIElements(app: app)
        
        app.buttons[Utility.localized(Constants.ApplicationContent.submitButton)].tap()
        app.buttons[Utility.localized(Constants.ApplicationContent.alertAction)].tap()
        
        mainViewControllerUIElements.firstNameTextField.tap()
        mainViewControllerUIElements.firstNameTextField.typeText(dummyUser.userName ?? "")
        dismissKeyboardIfPresent(app)
        
        XCUIDevice.shared.orientation = .landscapeRight
        
        app.buttons[Utility.localized(Constants.ApplicationContent.submitButton)].tap()
        app.buttons[Utility.localized(Constants.ApplicationContent.alertAction)].tap()
        
        mainViewControllerUIElements.emailTextField.tap()
        mainViewControllerUIElements.emailTextField.typeText(dummyUser.emailAddress ?? "")
        dismissKeyboardIfPresent(app)
        
        XCUIDevice.shared.orientation = .portrait
        
        app.buttons[Utility.localized(Constants.ApplicationContent.submitButton)].tap()
        app.buttons[Utility.localized(Constants.ApplicationContent.alertAction)].tap()
        
        mainViewControllerUIElements.websiteTextField.tap()
        mainViewControllerUIElements.websiteTextField.typeText(dummyUser.website.0 ?? "")
        dismissKeyboardIfPresent(app)
        
        XCUIDevice.shared.orientation = .landscapeRight
        
        app.buttons[Utility.localized(Constants.ApplicationContent.submitButton)].tap()
        app.buttons[Utility.localized(Constants.ApplicationContent.alertAction)].tap()
        
        mainViewControllerUIElements.passwordTextField.tap()
        mainViewControllerUIElements.passwordTextField.typeText("6204161718#Wel")
        dismissKeyboardIfPresent(app)
        
        XCUIDevice.shared.orientation = .portrait
        
        app.buttons[Utility.localized(Constants.ApplicationContent.submitButton)].tap()
        app.buttons[Utility.localized(Constants.ApplicationContent.signIn)].tap()
    }
    
    func dismissKeyboardIfPresent(_ app: XCUIApplication) {
        if app.keyboards.element(boundBy: 0).exists {
            if UIDevice.current.userInterfaceIdiom == .pad {
                app.keyboards.buttons["Hide keyboard"].tap()
            } else {
                app.toolbars.buttons["Done"].tap()
            }
        }
    }
    
}
