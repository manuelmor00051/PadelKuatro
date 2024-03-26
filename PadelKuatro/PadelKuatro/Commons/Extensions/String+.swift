//
//  String+.swift
//  PadelKuatro
//
//  Created by manuel.moreno.local on 23/2/24.
//

import Foundation

extension String {
    enum Images {
        static let splash = "Splash"
        static let ground = "Ground"
    }

    var localized: String {
        NSLocalizedString(self, comment: "")
    }

    var isEmail: Bool {
        let format = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        guard let validator = try? NSRegularExpression(pattern: format) else {
            return false
        }
        let numberOfMatches = validator.numberOfMatches(in: self, range: NSRange(location: 0, length: self.count))
        return numberOfMatches > 0
    }
}
