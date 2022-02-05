//
//  ConfirmationViewController.swift
//  Login-Flipgrid
//
//  Created by nikilesh balaji on 2/4/22.
//

import UIKit

class ConfirmationViewController: UIViewController {

    
    @IBOutlet weak var confirmationHeaderLabel: LoginUILabel!
    @IBOutlet weak var confirmationHelperLabel: LoginUILabel!
    @IBOutlet weak var userWebsiteLabel: LoginUILabel!
    @IBOutlet weak var userNameLabel: LoginUILabel!
    @IBOutlet weak var userEmailLabel: LoginUILabel!
    @IBOutlet weak var signinButton: LoginButton!
    
    var user: User?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupLabel()
        setupButton()
    }
    
    func setupLabel() {
        let headerLabelFont = UIFont.boldSystemFont(ofSize: 47.0)
        confirmationHeaderLabel.update(labelTextcolor: Constants.ApplicationColor.loginHeaderTextColor,
                                       font: headerLabelFont, withText: Constants.ApplicationContent.LoginConfirmationHeader.replacingOccurrences(of: "%s", with: user?.userName ?? ""))
        confirmationHelperLabel.update(labelTextcolor: Constants.ApplicationColor.loginHelperTextColor,
                                       font: nil, withText: Constants.ApplicationContent.LoginConfirmationHelperText)
        userWebsiteLabel.update(labelTextcolor: UIColor.blue, font: nil, withText: user?.website ?? "")
        userNameLabel.update(labelTextcolor: nil, font: nil, withText: user?.userName ?? "")
        userEmailLabel.update(labelTextcolor: nil, font: nil, withText: user?.emailAddress ?? "")
    }
    
    func setupButton() {
        signinButton.cornerRadius = signinButton.frame.size.height / 5
        signinButton.setTitle(Constants.ApplicationContent.signIn, for: .normal)
    }
    @IBAction func userClickedSiginButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
