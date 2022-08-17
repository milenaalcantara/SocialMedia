//
//  API.swift
//  networking
//
//  Created by Milena Lima de Alcântara on 10/08/22.
//

import Foundation

class API {
    
    static private let BASE_URL = "http://adaspace.local"
//    static private let BASE_URL = "http://127.0.0.1:8080"
    
    // MARK: Users
    static func createUser(newUser: User) async -> UserSession? {
        let url = URL(string: "\(BASE_URL)/users")
        var urlRequest = URLRequest(url: url!)
        
        let enconder = JSONEncoder()
        let newUserData = User(name: newUser.name, email: newUser.email, password: newUser.password)
        let payload = try! enconder.encode(newUserData)
        
        // Configuração
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-type")
        urlRequest.httpBody = payload
        
        // Execução
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let decodedNewUser: UserSession = try JSONDecoder().decode(UserSession.self, from: data)
            print("Novo Usuário: \(decodedNewUser)")
            return decodedNewUser
        } catch {
            print("Deu Ruim: \(error)")
        }
        
        return nil
    }
    
    static func getUsers() async -> [User] {
            let url = URL(string: "\(BASE_URL)/users")
            var urlRequest = URLRequest(url: url!)
            
            urlRequest.httpMethod = "GET"
            
            do {
                let (data, _) = try await URLSession.shared.data(for: urlRequest)
                let decodedUsers: [User] = try JSONDecoder().decode([User].self, from: data)
                
                return decodedUsers
            } catch {
                print("Deu Ruim: \(error)")
            }
            
            return []
        }
        
    static func getUsersById(_ id: String) async -> User {
        let url = URL(string: "\(BASE_URL)/\(id)")
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "GET"
        
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let decodedUser: User = try JSONDecoder().decode(User.self, from: data)
            print(decodedUser)
            return decodedUser
        } catch {
            print(error)
            fatalError("\(error)")
        }
    }
    
    
    // MARK: Posts
    static func getPosts() async -> [Post] {
        let url = URL(string: "\(BASE_URL)/posts")
        var urlRequest = URLRequest(url: url!)

        urlRequest.httpMethod = "GET"

        do {
            let decoder = JSONDecoder()
            let formatter = ISO8601DateFormatter()
            formatter.formatOptions = [.withFullDate]

            decoder.dateDecodingStrategy = .custom({ decoder in
                let container = try decoder.singleValueContainer()
                let dateString = try container.decode(String.self)

                if let date = formatter.date(from: dateString) {
                    return date
                }

                throw DecodingError.dataCorruptedError(in: container, debugDescription: "Cannot decode date string \(dateString)")
            })

            do {
                let (data, _) = try await URLSession.shared.data(for: urlRequest)
                let allPosts = try decoder.decode([Post].self, from: data)
//                print(decoder)
//                for i in allPosts {
//                    print(i)
//                }
                return allPosts
            } catch {
                print("deu ruim rapaz: \(error)")
            }
        }
        return []
    }
}
