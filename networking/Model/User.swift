//
//  File.swift
//  networking
//
//  Created by Milena Lima de Alcântara on 09/08/22.
//

import Foundation

struct User: Codable {
    var email: String = ""
    var password: String = ""
}

struct NewUser: Codable {
    let name: String
    let email: String
    let password: String
}

struct UserOfSession: Codable {
    let id: String
    let name: String
    let email: String
}

struct UserSession: Codable {
    let token: String
    let user: UserOfSession
}

//
//struct LoginResponse: Codable {
//    let token: String?
//    let message: String?
//    let success: Bool?
//}

