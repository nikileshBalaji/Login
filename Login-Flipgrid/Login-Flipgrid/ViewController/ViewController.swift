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
    
    @IBOutlet weak var userInputView: UIView!
    @IBOutlet weak var submitButtonTopLayout: NSLayoutConstraint!
    
    var originalHeight: CGFloat?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUILabels()
        setUpTextField()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
        updateButtonConstraints()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        DispatchQueue.main.async {
            self.updateButtonConstraints()
        }
    }
    
    func updateButtonConstraints() {
        if let windowScene = self.view.window?.windowScene,
           ((windowScene.interfaceOrientation.isPortrait && UIDevice.current.userInterfaceIdiom == .phone)
            || (UIDevice.current.userInterfaceIdiom == .pad)) {
            let userInputcontentView = userInputView.frame.height
            let mainview = self.view.safeAreaLayoutGuide.layoutFrame.height
            let finalHeight = mainview - userInputcontentView - submitButton.frame.height - 50
            originalHeight = submitButtonTopLayout.constant
            submitButtonTopLayout.constant = finalHeight
        } else {
            if let height = originalHeight {
                submitButtonTopLayout.constant = height
            }
        }
    }
 
    @IBAction func userClickedSubmit(_ sender: LoginButton) {
        if let viewController = self.storyboard?
            .instantiateViewController(withIdentifier: "ConfirmationView") as? ConfirmationViewController {
            if let person = User.init(name: firstNameTextField.text,
                                      email: emailAddressTextField.text,
                                      password: passwordTextField.text,
                                      website: websiteTextField.text) {
                viewController.user = person
                viewController.modalPresentationStyle = .fullScreen
                self.present(viewController, animated: true, completion: nil)
            } else {
                showAlertOfMissingInformation()
            }
        }
    }
    
    func showAlertOfMissingInformation() {
        let action = UIAlertAction(title: Constants.ApplicationContent.alertAction, style: .default, handler: nil)
        let alert = UIAlertController(title: Constants.ApplicationContent.profileCreationAlertHeader,
                                                message: Constants.ApplicationContent.profileCreationAlertMessage, preferredStyle: .alert)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}

