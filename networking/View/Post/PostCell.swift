//
//  PostCell.swift
//  networking
//
//  Created by Milena Lima de Alcântara on 10/08/22.
//

import SwiftUI

struct PostCell: View {
    @State var favorite: Bool = false
    @ObservedObject var postVM: PostViewModel = PostViewModel()
    
    let post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 5) {
                Text("\(post.content)")
                    .foregroundColor(.black)
            }
            .padding(50)
            
            HStack {
                VStack(alignment: .leading) {
                    Button(
                        action: {
                            Task {
                                withAnimation { favorite.toggle() }
//                                if favorite {
//                                    postVM.addFavorite(favourite: post)
//                                } else {
//                                    postVM.removeFavourite(favourite: post)
//                                }
                            }
                        },
                        label: {
                            HStack(spacing: 4) {
                                ZStack {
                                    Image(systemName: "heart.fill")
                                        .font(.system(size: 30))
                                    Image(systemName: "heart.fill")
                                        .font(.system(size: 30))
                                        .opacity(favorite ? 1: 0)
                                        .scaleEffect(favorite ? 1 : 0.1)
                                }
                                .frame(width: 30)
                            }
                            .foregroundColor(favorite ? .pink : .white)
                            .frame(height: 30)
                        }
                    )
                    .buttonStyle(.plain)
                }
                
                Spacer()
            }
            .padding(16)
            .background(Color.purple.opacity(0.8))
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.purple, lineWidth: 2)
        )
        .frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.width - 150)
//        .padding([.top, .horizontal])
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: Post(id: "1", content: "Post teste", userId: "1", createdAt: Date(), updatedAt: Date()))
    }
}
