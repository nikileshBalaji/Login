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
    
    
    @IBOutlet weak var userInfoDisplayStackView: UIStackView!
    var user: User?
    
    @IBOutlet weak var signInButtonTopConstraint: NSLayoutConstraint!
    var originalHeight = 0.0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupLabel()
        setupTextView()
        setupButton()
    }
    
    func setupLabel() {
        let headerLabelFont = UIFont.boldSystemFont(ofSize: 47.0)
        confirmationHeaderLabel.update(labelTextcolor: Constants.ApplicationColor.loginHeaderTextColor,
                                       font: headerLabelFont,
                                       withText: LocalizationString.localization(stringID: Constants.ApplicationContent.LoginConfirmationHeader).replacingOccurrences(of: "%s", with: user?.userName ?? ""))
        confirmationHelperLabel.update(labelTextcolor: Constants.ApplicationColor.loginHelperTextColor,
                                       font: nil, withText: LocalizationString.localization(stringID:
                                                        Constants.ApplicationContent.LoginConfirmationHelperText))
        userNameLabel.update(labelTextcolor: nil, font: nil, withText: user?.userName ?? "")
        userEmailLabel.update(labelTextcolor: nil, font: nil, withText: user?.emailAddress ?? "")
    }
    
    func setupTextView() {
        var userSiteURL = user?.website.0
        if let shouldRemoveHTTPExtension = user?.website.1, shouldRemoveHTTPExtension {
            userSiteURL = user?.website.0?.replacingOccurrences(of: "https://", with: "") ?? ""
        }
        let attributedString = NSMutableAttributedString(string: userSiteURL ?? "" )
        let url = URL(string: user?.website.0 ?? LocalizationString.localization(stringID:
                                                                                    Constants.ApplicationContent.defaultURL))!
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
        signinButton.setTitle(LocalizationString.localization(stringID:
                                        Constants.ApplicationContent.signIn), for: .normal)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            self.updateButtonConstraints()
        })
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        DispatchQueue.main.async {
            self.updateButtonConstraints()
        }
    }
    
    func updateButtonConstraints() {
        let userInputcontentView = userInfoDisplayStackView.frame.height
        let mainview = self.view.safeAreaLayoutGuide.layoutFrame.height
        let finalHeight = mainview - userInputcontentView - signinButton.frame.height - 50
        //  UIDevice.current.orientation.isPortrait does not give expected result.
        if let windowScene = self.view.window?.windowScene,
           ((windowScene.interfaceOrientation.isPortrait && UIDevice.current.userInterfaceIdiom == .phone) ||
        (UIDevice.current.userInterfaceIdiom == .pad)) {
            if (userInputcontentView < mainview) {
                originalHeight = signInButtonTopConstraint.constant
                signInButtonTopConstraint.constant = finalHeight
            }
        } else {
            if (userInputcontentView < mainview) {
                originalHeight = signInButtonTopConstraint.constant
                signInButtonTopConstraint.constant = finalHeight
            } else {
                signInButtonTopConstraint.constant = originalHeight
            }
        }
    }
    
    @IBAction func userClickedSiginButton(_ sender: LoginButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
