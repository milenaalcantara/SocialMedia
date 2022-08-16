//
//  UserViewModel.swift
//  networking
//
//  Created by Milena Alcântara e Thaynara Andrade on 09/08/22.
//

import Foundation

class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []
    
    @MainActor
    func publishPosts(posts: [Post]) {
        self.posts = posts
    }
    
    func fetchPosts() async {
        let allPosts = await API().getPosts()
        await publishPosts(posts: allPosts)
    }
}
