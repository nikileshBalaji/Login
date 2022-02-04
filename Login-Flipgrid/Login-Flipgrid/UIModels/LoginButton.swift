//
//  LoginButton.swift
//  Login-Flipgrid
//
//  Created by nikilesh balaji on 2/4/22.
//

import Foundation
import UIKit

class LoginButton: UIButton {
    
    let startColor = UIColor(red: 232/255, green: 92/255, blue: 44/255, alpha: 1).cgColor
    let middleColor = UIColor(red: 231/255, green: 77/255, blue: 56/255, alpha: 1).cgColor
    let endColor = UIColor(red: 230/255, green: 59/255, blue: 89/255, alpha: 1).cgColor
   
    /// set corner radius
    var cornerRadius: CGFloat?
    
    /// set gradient colors of you UIButton, defaults to Flipgrid document
    var gradientColors: [CGColor]?
    
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
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = gradientColors ?? [startColor, middleColor, endColor]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        self.layer.insertSublayer(gradient, at: 0)

        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadius ?? 0
    }
}
