//
//  ContentView.swift
//  networking
//
//  Created by Milena Lima de Alcântara on 09/08/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var loginVM: LoginViewModel
    @State var session : UserSession?

    var body: some View {
        if (loginVM.isLoggedIn) {
            PostList(session: $session)
        } else {
            LoginView( login: $session)
        }

    }
}
