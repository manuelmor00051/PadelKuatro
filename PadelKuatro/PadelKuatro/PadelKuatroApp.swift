//
//  PadelKuatroApp.swift
//  PadelKuatro
//
//  Created by manuel.moreno.local on 23/2/24.
//

import SwiftUI
import FirebaseCore

@main
struct PadelKuatroApp: App {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
