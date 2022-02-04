//
//  ViewController.swift
//  Login-Flipgrid
//
//  Created by nikilesh balaji on 2/3/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var profilePageHeaderLabel: UILabel!
    @IBOutlet weak var profilePageHelperLabel: UILabel!
    @IBOutlet weak var firstNameTextField: LoginTextField!
    @IBOutlet weak var emailAddressTextField: LoginTextField!
    @IBOutlet weak var passwordTextField: LoginTextField!
    @IBOutlet weak var websiteTextField: LoginTextField!
    @IBOutlet weak var submitButton: LoginButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpTextField()
        setupButton()
    }
    
    func setUpTextField() {
        firstNameTextField.placeHolderText = "First Name"
        emailAddressTextField.placeHolderText = "Email Address"
        passwordTextField.placeHolderText = "Password"
        websiteTextField.placeHolderText = "Website"
    }
    
    func setupButton() {
        submitButton.cornerRadius = submitButton.frame.size.height / 5
        submitButton.setTitle("Submit", for: .normal)
    }
    
    @IBAction func userClickedSubmit(_ sender: LoginButton) {
        
    }
    
}

