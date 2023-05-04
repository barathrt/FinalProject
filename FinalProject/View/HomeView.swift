//
//  HomeView.swift
//  FinalProject
//
//  Created by Barath Mohan on 5/4/23.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        NavigationStack {
            VStack {
                HStack {
                    ExtractedNavigationView(view: AnyView(PostsView()), title: "Posts")
                    ExtractedNavigationView(view: AnyView(PhotosView()), title: "Photos")
                    ExtractedNavigationView(view: AnyView(CatsView()), title: "Cats")
                }
            }
            .navigationTitle("Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct ExtractedNavigationView: View {
    
    var view: AnyView
    var title: String
    
    var body: some View {
        NavigationLink {
            view
        } label: {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 100, height: 100)
                .background(Color(.systemPink))
                .cornerRadius(10)
                .padding()
        }
    }
}
