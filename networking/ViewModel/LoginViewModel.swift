//
//  LoginViewModel.swift
//  networking
//
//  Created by Milena Lima de Alcântara on 17/08/22.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var credentials = User()
    @Published var isLoggedIn: Bool = false
    
    func initSession() async -> UserSession? {
        let newSession = await API.loginSession(email: credentials.email, password: credentials.password)
        
        if let session = newSession {
            if session.token != "" {
            DispatchQueue.main.async {
                self.isLoggedIn = true
            }
                return session

            }else{
                print("token vazio na função initSession!!")
                return nil
            }
        } else {
            print("não existe sessão na função initSession!!")
            return nil
        }
    }
    
//    func logout(){
//        API().getLogout(token: session!.token){ result in
//                if (result?.token) != nil {
//                    DispatchQueue.main.async {
//                        self.isLoggedIn = false
//                    }
//                } else {
//                    print("error")
//                }
//            }
//        }
}
