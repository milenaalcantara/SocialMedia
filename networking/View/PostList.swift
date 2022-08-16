//
//  PostList.swift
//  networking
//
//  Created by Milena Alcântara e Thaynara Andrade on 10/08/22.
//

import SwiftUI

struct PostList: View {
    @ObservedObject var viewModel: PostViewModel = PostViewModel()
    
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
//            Image("")
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
                PostCell(post: post)
                    .padding(20)
            }
        }
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList()
    }
}
