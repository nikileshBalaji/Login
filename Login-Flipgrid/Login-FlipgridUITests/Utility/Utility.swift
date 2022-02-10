//
//  Utility.swift
//  Login-FlipgridUITests
//
//  Created by nikilesh balaji on 2/9/22.
//

import Foundation

class Utility {
    
    static func localized(_ key: String) -> String {
        let uiTestBundle = Bundle(for: Login_FlipgridUITests.self)
        return NSLocalizedString(key, bundle: uiTestBundle, comment: "")
    }
}
