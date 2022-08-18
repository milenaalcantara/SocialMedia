//
//  Authentication.swift
//  networking
//
//  Created by Milena Lima de Alcântara on 17/08/22.
//

import SwiftUI

class Authentication: ObservableObject {
    @Published var isValidated = false
    
    enum AuthenticationError: Error, LocalizedError, Identifiable {
        case invalidCredentials
        
        var id: String {
            self.localizedDescription
        }
        
        var errorDescription: String? {
            switch self {
            case .invalidCredentials:
                return NSLocalizedString("Seu e-mail ou sua senha estão incorretos. Por favor, tente novamente!", comment: "")
            }
        }
    }
    
    func updateValidation(success: Bool) {
        withAnimation {
            isValidated = success
        }
    }
}
