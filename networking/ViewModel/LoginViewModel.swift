//
//  LoginViewModel.swift
//  networking
//
//  Created by Milena Lima de Alcântara on 17/08/22.
//

import Foundation

class LoginViewModel: ObservableObject {
    // MARK: - Properties
    
    @Published var credentials = User()
    
    @Published var token: String = ""

    // MARK: -

    @Published var hasError = false

    @Published var isSigningIn = false

    // MARK: -

//    var canSignIn: Bool {
//        !credentials.email.isEmpty && !credentials.password.isEmpty
//    }
    
    func initSession(isNewUser: Bool, email: String = "", password: String = "") async -> UserSession? {
        if (isNewUser) {
            return await API.loginSession(email: email, password: password)
        }
        return await API.loginSession(email: credentials.email, password: credentials.password)
    }
    
    
//    @Published var credentials = User()
//    @Published var showProgressView = false
//    @Published var error: Authentication.AuthenticationError?
//
//    var loginDisabled: Bool {
//        credentials.email.isEmpty || credentials.password.isEmpty
//    }
//
//    func login(completion: @escaping (Bool) -> Void) {
//        showProgressView = true
//        API().login(credentials: credentials) { [unowned self](result:Result<Bool, Authentication.AuthenticationError>) in
//         showProgressView = false
//            switch result {
//            case .success:
//                completion(true)
//            case .failure(let authError):
//                credentials = User()
//                error = authError
//                completion(false)
//            }
//        }
//    }
}
