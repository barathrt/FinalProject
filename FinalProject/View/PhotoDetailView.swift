//
//  PhotoDetailView.swift
//  FinalProject
//
//  Created by Barath Mohan on 5/4/23.
//

import SwiftUI

struct PhotoDetailView: View {
    
    var photoDetails: PhotosModel
    var imageHeight: CGFloat = 200
    
    var body: some View {
        NavigationStack {
            VStack {
                
                AsyncImage(url: URL(string: photoDetails.url)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity)
                            .frame(height: imageHeight)
                            .clipped()
                            .cornerRadius(5)
                    } else if phase.error != nil {
                        Text(phase.error?.localizedDescription ?? "error")
                            .foregroundColor(Color.pink)
                            .frame(maxWidth: .infinity)
                            .frame(height: imageHeight)
                    } else {
                        ProgressView()
                            .frame(maxWidth: .infinity)
                            .frame(height: imageHeight)
                    }
                }
                HStack {
                    Text(photoDetails.title)
                        .multilineTextAlignment(.leading)
                        .fontWeight(.black)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                }.padding(.top)
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.top, 1)
                Spacer()
            }
                .navigationTitle("Image Details")
        }.padding(.horizontal)
    }
}

struct PhotoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoDetailView(photoDetails: PhotosModel(albumId: 0, id: 0, title: "", url: "", thumbnailUrl: ""))
    }
}
