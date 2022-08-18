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


//class UserViewModel: ObservableObject {
    
//    @objc func buttonAction(sender: UIButton!){
//    let newUser = NewUser(name: nameInput.text!, email: emailInput.text!, password: passwordInput.text!)
//     Task {
//         let session = await viewModel.createNewUser(newUser: newUser)
//         print(session)
//    }
//}
    
//    var users: [User] = []
    
//    func fetchUsers() async {
//        API.getUsers { (users) in
//            print(users)
//        }
//    }
    
//    func addUser(user: User) async {
//        do {
//            let createdUser = try await API.createUser()
////                .setUser(user: user)
//            print(createdUser)
//        } catch {
//            print("Algo deu errado: \(error)" )
//        }
//    }
    
//    func login(user: User.authentication) async {
//        do {
//            let responseData = try await API.authenticateUser(user: user)
//            print(responseData)
//
//
//            let accessToken = responseData.token
//            let data = Data(accessToken.utf8)
//            KeychainHelper.standard.save(data, service: "access-token", account: "skynet")
//
//            let readData = KeychainHelper.standard.read(service: "access-token", account: "skynet")!
//            let readAccessToken = String(data: readData, encoding: .utf8)!
//            print("token: \(readAccessToken)")
//        } catch {
//            print("Algo deu errado: \(error)" )
//        }
//    }

