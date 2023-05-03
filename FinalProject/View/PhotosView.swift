//
//  PhotosView.swift
//  FinalProject
//
//  Created by Barath Mohan on 5/3/23.
//

import SwiftUI

struct PhotosView: View {
    
    @ObservedObject var photosVM = PhotosViewModel()
    let imageSize: CGFloat = 40
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(photosVM.photoAlbum, id: \.id) { photoData in
                        HStack {
                            VStack {
                                
                                AsyncImage(url: URL(string: photoData.thumbnailUrl)) { phase in
                                    if let image = phase.image {
                                        image.resizable()
                                            .scaledToFill()
                                            .frame(width: imageSize, height: imageSize)
                                            .clipped()
                                        
                                    } else if phase.error != nil {
                                        
                                        Text(phase.error?.localizedDescription ?? "error")
                                            .foregroundColor(Color.pink)
                                            .frame(width: imageSize, height: imageSize)
                                    } else {
                                        ProgressView()
                                            .frame(width: imageSize, height: imageSize)
                                    }
                                    
                                }
                                
                            }.frame(alignment: .leading)
                            VStack {
                                Text(photoData.title)
                                    .frame(alignment: .leading)
                                    .multilineTextAlignment(.leading)
                            }
                        }
                    }.navigationTitle("Photos")
                        .onAppear {
                            photosVM.getPhotoAlbum()
                        }
                }
            }
        }
    }
}

struct PhotosView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosView()
    }
}
