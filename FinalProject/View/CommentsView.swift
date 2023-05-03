//
//  CommentsView.swift
//  FinalProject
//
//  Created by Barath Mohan on 5/3/23.
//

import SwiftUI

struct CommentsView: View {
    
    var postID = -1
    @ObservedObject private var commentsVM = CommentsViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(commentsVM.commentsData, id: \.id) { comment in
                    VStack {
                        Text(comment.name)
                            .fontWeight(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(comment.body)
                            .padding(.bottom)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }.padding(.horizontal)
                }
                .navigationTitle("Comments")
                .onAppear {
                    commentsVM.getCommentsData(postID: postID)
                }
            }
        }
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView()
    }
}
