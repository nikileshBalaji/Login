//
//  LoginTextField.swift
//  Login-Flipgrid
//
//  Created by nikilesh balaji on 2/3/22.
//

import Foundation
import UIKit

@IBDesignable
class LoginTextField: UITextField, UITextFieldDelegate {
    
    /// set placeholder Text
    var placeHolderText: String = "Submit"
    
    /// set border width
    var borderWidth: CGFloat = 0.4
    
    /// set border color
    var borderColor: CGColor = UIColor.gray.cgColor
    
    /// set corner radius
    var cornerRadius: CGFloat?
    
    override init(frame: CGRect){
            super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    
    func setup() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.height / 5
        self.layer.borderColor = borderColor
        self.layer.borderWidth = borderWidth
        self.attributedPlaceholder = NSAttributedString(string: placeHolderText,
                                attributes: [NSAttributedString.Key.foregroundColor:
                                UIColor.init(displayP3Red: 105/255, green: 105/255, blue: 105/255, alpha: 1),
                                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16) ])
        self.font = UIFont.boldSystemFont(ofSize: 16)
        self.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
