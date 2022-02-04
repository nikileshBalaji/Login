//
//  UIButtonExtension.swift
//  Login-Flipgrid
//
//  Created by nikilesh balaji on 2/3/22.
//

import Foundation
import UIKit

extension UIButton {
    
    func applyGradient(colors: [CGColor]) {
        
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colors
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        self.layer.insertSublayer(gradient, at: 0)
        
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.height / 5
    }
}
