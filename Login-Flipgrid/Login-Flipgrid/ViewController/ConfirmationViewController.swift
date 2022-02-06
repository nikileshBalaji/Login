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
    @IBOutlet weak var userWebsiteTextView: UITextView!
    @IBOutlet weak var userNameLabel: LoginUILabel!
    @IBOutlet weak var userEmailLabel: LoginUILabel!
    @IBOutlet weak var signinButton: LoginButton!
    
    var user: User?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupLabel()
        setupTextView()
        setupButton()
    }
    
    func setupLabel() {
        let headerLabelFont = UIFont.boldSystemFont(ofSize: 47.0)
        confirmationHeaderLabel.update(labelTextcolor: Constants.ApplicationColor.loginHeaderTextColor,
                                       font: headerLabelFont, withText: Constants.ApplicationContent.LoginConfirmationHeader.replacingOccurrences(of: "%s", with: user?.userName ?? ""))
        confirmationHelperLabel.update(labelTextcolor: Constants.ApplicationColor.loginHelperTextColor,
                                       font: nil, withText: Constants.ApplicationContent.LoginConfirmationHelperText)
        userNameLabel.update(labelTextcolor: nil, font: nil, withText: user?.userName ?? "")
        userEmailLabel.update(labelTextcolor: nil, font: nil, withText: user?.emailAddress ?? "")
    }
    
    func setupTextView() {
        var userSiteURL = user?.website.0
        if let shouldRemoveHTTPExtension = user?.website.1, shouldRemoveHTTPExtension {
            userSiteURL = user?.website.0?.replacingOccurrences(of: "https://", with: "") ?? ""
        }
        let attributedString = NSMutableAttributedString(string: userSiteURL ?? "" )
        let url = URL(string: user?.website.0 ?? "")!
        attributedString.setAttributes([.link: url,
                                        NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)], range: NSMakeRange(0, userSiteURL?.count ?? 0))
        userWebsiteTextView.attributedText = attributedString
        self.userWebsiteTextView.isUserInteractionEnabled = true
        self.userWebsiteTextView.linkTextAttributes = [
            .foregroundColor: UIColor.blue,
            .underlineStyle: NSUnderlineStyle.single.rawValue
            
        ]
        self.userWebsiteTextView.textAlignment = .center
    }
    
    func setupButton() {
        signinButton.cornerRadius = signinButton.frame.size.height / 5
        signinButton.setTitle(Constants.ApplicationContent.signIn, for: .normal)
    }
    
    @IBAction func userClickedSiginButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
