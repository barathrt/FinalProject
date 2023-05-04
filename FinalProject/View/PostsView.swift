//
//  PostsView.swift
//  FinalProject
//
//  Created by Barath Mohan on 5/2/23.
//

import SwiftUI

struct PostsView: View {
    
    @ObservedObject var postVM = PostViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(postVM.posts, id: \.id) { post in
                        NavigationLink(destination: CommentsView(postID: post.id)) {
                            HStack {
                                VStack {
                                    Text("\(post.id)")
                                        .frame(width:40, height:40, alignment: .center)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(.blue, lineWidth: 5)
                                            
                                        )
                                    Spacer()
                                }
                                .padding()
                                VStack {
                                    Text(post.title)
                                        .fontWeight(.bold)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Text(post.body)
                                        .foregroundColor(.gray)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.bottom)
                                        .lineLimit(2)
                                }
                            }
                        }.buttonStyle(PlainButtonStyle())
                        
                    }.padding(.horizontal)
                }
            }
        }.navigationTitle("Posts")
            .onAppear {
                postVM.getPostData()
            }
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView()
    }
}
