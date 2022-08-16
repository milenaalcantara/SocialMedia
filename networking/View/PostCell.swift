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
        VStack(alignment: .leading, spacing: 5) {
            Text("\(post.content)")
        }
        
    }
}

//struct PostCell_Previews: PreviewProvider {
//    static var previews: some View {
//        PostCell(post: <#Post#>)
//    }
//}
