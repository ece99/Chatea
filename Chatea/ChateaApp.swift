//
//  ChateaApp.swift
//  Chatea
//
//  Created by Ece Ayvaz on 20.10.2021.
//

import SwiftUI
import Firebase

@main
struct ChateaApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
