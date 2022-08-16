//
//  API.swift
//  networking
//
//  Created by Milena Lima de Alcântara on 10/08/22.
//

import Foundation

class API {
    // MARK: Users
    func postUsers() async -> [UserSession] {
        let url = URL(string: "http://adaspace.local/users")
        var urlRequest = URLRequest(url: url!)
        
        // Configuração
        urlRequest.httpMethod = "POST"
        
        // Execução
        do {
            
        }
        
        
        return []
    }
    
//    func getUsers() async -> [User] {
//        let url = URL(string: "http://adaspace.local/users")
//        var urlRequest = URLRequest(url: url!)
//
//        urlRequest.httpMethod = "GET"
//
//        do {
//            let (data, _) = try await URLSession.shared.data(for: urlRequest)
//            let userDecoded = try JSONDecoder().decode([User].self, from: data)
//            return userDecoded
//
//        } catch {
//            print("Error ao chamar user \(error)")
//        }
//        return []
//    }
    
    // MARK: Posts
    func getPosts() async -> [Post] {
        let url = URL(string: "http://adaspace.local/posts")
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
                print(decoder)
                for i in allPosts {
                    print(i)
                }
                return allPosts
            } catch {
                fatalError("deu ruim rapaz: \(error)")
            }
        }
    }

//    static func getPost() async -> [Post] {
//        let urlRequest = URLRequest(url: URL(string: "http://adaspace.local/posts")!)
//        do {
//            let (data, _) = try await URLSession.shared.data(for: urlRequest)
//            let postsDecoder = try JSONDecoder().decode([Post].self, from: data)
//            print(postsDecoder)
//            return postsDecoder
//        } catch {
//            print(error)
//        }
//
//        return []
//    }
}
