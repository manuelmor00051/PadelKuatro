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
}
