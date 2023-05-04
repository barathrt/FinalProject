//
//  CatImageView.swift
//  FinalProject
//
//  Created by Barath Mohan on 5/4/23.
//

import SwiftUI

struct CatImageView: View {
    
    @StateObject var imageLoader: ImageLoaderViewModel
    
    init(url: String?) {
        self._imageLoader = StateObject(wrappedValue: ImageLoaderViewModel(url: url))
    }
    
    var body: some View {
        Group {
            if imageLoader.image != nil {
                Image(uiImage: imageLoader.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else if imageLoader.errorMessage != nil {
                Text(imageLoader.errorMessage!)
            } else {
                ProgressView()
            }
        }.onAppear {
            imageLoader.fetch()
        }
        .cornerRadius(5)
    }
}

struct CatImageView_Previews: PreviewProvider {
    static var previews: some View {
        CatImageView(url: nil)
    }
}
