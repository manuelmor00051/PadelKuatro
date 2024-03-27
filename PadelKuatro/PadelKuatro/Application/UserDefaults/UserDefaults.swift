//
//  UserDefaults.swift
//  PadelKuatro
//
//  Created by manuel.moreno.local on 27/3/24.
//

import Foundation

enum UserDefaultsKeys: String {
    case userId = "UserId"
}

struct UserDefaultsManager {

    static func saveUserId(user: String) {
        UserDefaults.standard.set(user, forKey: UserDefaultsKeys.userId.rawValue)
    }
}
