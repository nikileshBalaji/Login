//
//  LoginUILabel.swift
//  Login-Flipgrid
//
//  Created by nikilesh balaji on 2/4/22.
//

import Foundation
import UIKit

@IBDesignable
/// Custom UILabel for Login
class LoginUILabel: UILabel {
    
    /// set Label Text
    var labelText : String = ""
    
    /// set label text color, defaults to gray
    var labelTextColor: UIColor? = UIColor.gray
    
    ///  set label font ,defaults to boldSystemFont of size 16
    var labelFont: UIFont = UIFont.boldSystemFont(ofSize: 16.0)
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUILabel()
    }
    
    ///  update all the custom params
    /// - Parameters:
    ///   - labelTextcolor: text color of label, pass nil to use default color
    ///   - font:  text font of label, pass nil to use default font
    ///   - withText: text to be shown, pass nil to use default text which is empty text
    func update(labelTextcolor: UIColor?, font: UIFont?, withText: String?){
        self.labelTextColor = labelTextcolor ?? self.labelTextColor
        self.labelFont = font ?? self.labelFont
        self.labelText = withText ?? self.labelText
    }
    
    private func setupUILabel() {
        self.font = labelFont
        self.textColor = labelTextColor
        self.text = labelText
    }
    
}
