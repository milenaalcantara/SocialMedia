//
//  networkingApp.swift
//  networking
//
//  Created by Milena Lima de Alcântara on 09/08/22.
//

import SwiftUI

@main
struct networkingApp: App {
    @StateObject var authentication = Authentication()
    
    var body: some Scene {
        WindowGroup {
            PostList()
        }
//            if authentication.isValidated {
//                ContentView().environmentObject(authentication)
//            } else {
//                LoginView().environmentObject(authentication)
//            }        }
    }
}
