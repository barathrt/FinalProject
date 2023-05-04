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
                        NavigationLink(destination: PhotoDetailView(photoDetails: photoData)) {
                            HStack {
                                VStack {
                                    if photoData.thumbnailUrl != nil {
                                        ImageLoaderView(url: photoData.thumbnailUrl)
                                    } else {
                                        Color.gray.frame(width: imageSize, height: imageSize)
                                    }
                                }.frame(alignment: .leading)
                                VStack {
                                    Text(photoData.title)
                                        .frame(alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                }
                                Spacer()
                            }.padding(.horizontal)
                        }.buttonStyle(PlainButtonStyle())
                    }
                }.navigationTitle("Photos")
                    .onAppear {
                        photosVM.getPhotoAlbum()
                        URLCache.shared.memoryCapacity = 1024 * 1024 * 512
                        print("Cache size \(URLCache.shared.memoryCapacity / 1024 )KB")
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
