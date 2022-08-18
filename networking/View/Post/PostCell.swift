//
//  PostCell.swift
//  networking
//
//  Created by Milena Lima de Alcântara on 10/08/22.
//

import SwiftUI

struct PostCell: View {
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
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(.purple, lineWidth: 2)
                    .frame(width: 350, height: 160, alignment: .center)
                    .background(.white)
            )
            
            
            VStack {
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(.purple, lineWidth: 2)
                    .frame(width: 350, height: 40, alignment: .center)
                    .background(.purple)
            }
        }
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: Post(id: "1", content: "Post teste", userId: "1", createdAt: Date(), updatedAt: Date()))
    }
}
