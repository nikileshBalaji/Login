//
//  Constants.swift
//  Login-Flipgrid
//
//  Created by nikilesh balaji on 2/4/22.
//

import Foundation
import UIKit

struct Constants {
    
    struct ApplicationContent {
        static let profileCreationHeaderText =          "Profile Creation"
        static let profileCreationHelperText =          "Use the Form below to submit your portfolio. An email and password are required"
        static let profileCreationFirstName =           "First Name"
        static let profileCreationEmailAddress =        "Email Address"
        static let profileCreationPassword =            "Password"
        static let profileCreationWebsite  =            "Website"
        static let submitButton =                       "Submit"
        static let profileCreationAlertHeader =         "Missing Information"
        static let profileCreationAlertMessage =        "Enter information in all fields"
        
        static let LoginConfirmationHeader =            "Hello, %s!"
        static let LoginConfirmationHelperText =        "Your super-awesome portfolio has been successfully submitted! The details below will be within your community!"
        static let signIn =                             "Sign In"
        
        static let alertAction =                        "okay"
    }
    
    struct ApplicationColor {
        static let loginHeaderTextColor =      UIColor(red: 84/255, green: 84/255, blue: 84/255, alpha: 1.0)
        static let loginHelperTextColor =      UIColor(red: 127/255, green: 127/255, blue: 127/255, alpha: 1.0)
    }
}
