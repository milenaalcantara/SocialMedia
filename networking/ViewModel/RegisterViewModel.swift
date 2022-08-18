//
//  RegisterViewModel.swift
//  networking
//
//  Created by Milena Lima de Alcântara on 18/08/22.
//

import Foundation

class RegisterViewModel: ObservableObject{
    @Published var name: String = ""
    @Published var email:   String = ""
    @Published var password:   String = ""
    
    func createNewUser() async -> UserSession? {
        let newUSer = NewUser(name: name, email: email, password: password)
        
        return await API.createUser(newUser: newUSer)
    }
}

