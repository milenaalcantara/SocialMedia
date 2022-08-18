//
//  networkingApp.swift
//  networking
//
//  Created by Milena Lima de Alcântara on 09/08/22.
//

import SwiftUI

@main
struct networkingApp: App {
    @StateObject var loginVM = LoginViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(loginVM)
        }
    }
}
