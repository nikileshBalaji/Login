//
//  ViewController.swift
//  Login-Flipgrid
//
//  Created by nikilesh balaji on 2/3/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var profilePageHeaderLabel: LoginUILabel!
    @IBOutlet weak var profilePageHelperLabel: LoginUILabel!
    @IBOutlet weak var firstNameTextField: LoginTextField!
    @IBOutlet weak var emailAddressTextField: LoginTextField!
    @IBOutlet weak var passwordTextField: LoginTextField!
    @IBOutlet weak var websiteTextField: LoginTextField!
    @IBOutlet weak var submitButton: LoginButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUILabels()
        setUpTextField()
        setupButton()
    }
    
    func setupUILabels() {
        let headerLabelFont = UIFont.boldSystemFont(ofSize: 47.0)
        profilePageHeaderLabel.update(labelTextcolor: Constants.ApplicationColor.loginHeaderTextColor,
                                      font: headerLabelFont,
                                      withText: Constants.ApplicationContent.profileCreationHeaderText)
        profilePageHelperLabel.update(labelTextcolor: Constants.ApplicationColor.loginHelperTextColor,
                                      font: nil,
                                      withText: Constants.ApplicationContent.profileCreationHelperText)
    }
    
    func setUpTextField() {
        firstNameTextField.placeHolderText = Constants.ApplicationContent.profileCreationFirstName
        emailAddressTextField.placeHolderText = Constants.ApplicationContent.profileCreationEmailAddress
        passwordTextField.secureText = true
        passwordTextField.placeHolderText = Constants.ApplicationContent.profileCreationPassword
        websiteTextField.placeHolderText = Constants.ApplicationContent.profileCreationWebsite
    }
    
    func setupButton() {
        submitButton.cornerRadius = submitButton.frame.size.height / 5
        submitButton.setTitle(Constants.ApplicationContent.submitButton, for: .normal)
    }
    
    @IBAction func userClickedSubmit(_ sender: LoginButton) {
        if let viewController = self.storyboard?
            .instantiateViewController(withIdentifier: "ConfirmatioView") as? ConfirmationViewController {
            if let person = verifyAndcreateUser() {
                viewController.user = person
                viewController.modalPresentationStyle = .fullScreen
                self.present(viewController, animated: true, completion: nil)
            } else {
                let action = UIAlertAction(title: Constants.ApplicationContent.alertAction, style: .default, handler: nil)
                let alert = UIAlertController(title: Constants.ApplicationContent.profileCreationAlertHeader,
                                                        message: Constants.ApplicationContent.profileCreationAlertMessage, preferredStyle: .alert)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
           
        }
    }
    
    func verifyAndcreateUser() -> User? {
        guard let name = firstNameTextField.text, !name.isEmpty,
              let email = emailAddressTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty,
              let website = websiteTextField.text, !website.isEmpty else {
                  return nil
              }
            return User(name: firstNameTextField.text!,
                        email: emailAddressTextField.text!,
                        password: passwordTextField.text!,
                        website: websiteTextField.text!)
    }
    
}

