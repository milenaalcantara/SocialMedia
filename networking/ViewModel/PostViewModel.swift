//
//  UserViewModel.swift
//  networking
//
//  Created by Milena Alcântara e Thaynara Andrade on 09/08/22.
//

import Foundation

class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var favourites: [Post] = []
    
    @MainActor
    func publishPosts(posts: [Post]) {
        self.posts = posts
    }
    
    func fetchPosts() async {
        let allPosts = await API.getPosts()
        await publishPosts(posts: allPosts)
    }
    
//    func addFavorite(favourite: Post) {
//        favourites.append(favourite)
//    }
    
//    func removeFavourite(favourite: Post) {
//        let position = favourites.filter({ $0.id == favourite.id })
//        favourites.remove(at: )
//    }
}
