//
//  Post.swift
//  networking
//
//  Created by Milena Lima de Alcântara on 10/08/22.
//

import Foundation

struct Post: Codable {
    let id : String
    let content : String
    let userId : String
    let createdAt : Date
    let updatedAt : Date
    
    enum CodingKeys: String, CodingKey {
        case id, content
        case userId = "user_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
