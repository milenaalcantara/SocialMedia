//
//  PostList.swift
//  networking
//
//  Created by Milena Alcântara e Thaynara Andrade on 10/08/22.
//

import SwiftUI

struct PostList: View {
    @ObservedObject var viewModel: PostViewModel = PostViewModel()
    @Binding var session : UserSession?
    
    var body: some View {
        ZStack {
            if viewModel.posts.isEmpty {
                emptyState
            } else {
                postList
            }
        }
        .task {
            await viewModel.fetchPosts()
        }
    }
    
    var emptyState: some View {
        VStack {
            Text("Loading...")
                .font(.title)
            ProgressView()
                .progressViewStyle(.circular)
                .scaleEffect(1.5)
                .padding()
        }
    }
    
    var postList: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(viewModel.posts, id: \.id) { post in
                PostCell(
                    post: post
                )
                    .padding(20)
            }
        }
    }
}

//CatBreedCell(
//    catBreed: cat,
//    beginsFavourited: viewModel.favorites.contains { cat.id == $0.id },
//    addFavoriteHandler: {
//        await viewModel.addFavorite(cat: $0)
//    },
//    removeFavoriteHandler: {
//        await viewModel.removeFavorite(cat: $0)
//    }
//)
//.padding(20)
