//
//  ImageLoaderView.swift
//  FinalProject
//
//  Created by Barath Mohan on 5/4/23.
//

import SwiftUI

struct ImageLoaderView: View {
    
    @StateObject var imageLoader: ImageLoaderViewModel
    let imageSize: CGFloat = 70
    
    init(url: String?) {
        self._imageLoader = StateObject(wrappedValue: ImageLoaderViewModel(url: url))
    }
    
    var body: some View {
        Group {
            if imageLoader.image != nil {
                Image(uiImage: imageLoader.image!)
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: imageSize, height: imageSize)
            } else if imageLoader.errorMessage != nil {
                Text(imageLoader.errorMessage!)
                    .foregroundColor(Color.pink)
                    .frame(width: imageSize, height: imageSize)
            } else {
                ProgressView()
                    .frame(width: imageSize, height: imageSize)
            }
        }.onAppear {
            imageLoader.fetch()
        }
        .cornerRadius(5)
    }
}

struct ImageLoaderView_Previews: PreviewProvider {
    static var previews: some View {
        ImageLoaderView(url: nil)
    }
}
