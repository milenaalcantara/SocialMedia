//
//  UserViewModel.swift
//  networking
//
//  Created by Milena Lima de Alcântara on 11/08/22.
//

import Foundation

class UserViewModel {
    func createNewUser(newUser: NewUser) async -> UserSession? {
        return await API.createUser(newUser: newUser)
    }
}
