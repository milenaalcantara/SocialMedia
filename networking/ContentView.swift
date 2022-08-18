//
//  ContentView.swift
//  networking
//
//  Created by Milena Lima de Alcântara on 09/08/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authentication: Authentication
    
    var body: some View {
        NavigationView {
            PostList()
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Log out") {
                            authentication.updateValidation(success: false)
                        }
                    }
                }
//            VStack {
//                Text("Authorized..  You are in!!")
//                    .font(.largeTitle)
//                Image("Inside")
//            }
//                .padding()
//                .navigationTitle("My Secure App")
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button("Log out") {
//                        authentication.updateValidation(success: false)
//                    }
//                }
//            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
