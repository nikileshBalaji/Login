//
//  NSLocalizedStringExtension.swift
//  Login-Flipgrid
//
//  Created by nikilesh balaji on 2/9/22.
//

import Foundation

struct LocalizationString {
    
    static func localization(stringID: String) -> String {
        return NSLocalizedString(stringID, comment: "")
    }
}
