//
//  File.swift
//  networking
//
//  Created by Milena Lima de Alcântara on 09/08/22.
//

import Foundation

struct User: Codable {
    let name: String
    let email: String
    let password: String
    
    enum CodingKeys: String, CodingKey {
        case name, email, password
    }
}

struct UserFromSession: Codable {
    let id: String
    let name: String
    let email: String
    let avatar: String
}

struct UserSession: Codable {
    let token: String
    let user: UserFromSession
}
