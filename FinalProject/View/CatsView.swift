//
//  CatsView.swift
//  FinalProject
//
//  Created by Barath Mohan on 5/4/23.
//

import SwiftUI
import WaterfallGrid

struct CatsView: View {
    
    @StateObject var catsVM = CatsViewModel()
    let imageSize: CGFloat = 100
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    WaterfallGrid(catsVM.catImages, id: \.id) { catImage in
                        CatImageView(url: catImage.url)
                            .onAppear {
                                print("Image Appear \(catImage.url)")
                            }
                    }
                    .gridStyle(
                        columnsInPortrait: 2,
                        columnsInLandscape: 3,
                        spacing: 8,
                        animation: .easeInOut(duration: 0.5)
                    )
                    .scrollOptions(direction: .vertical)
                    .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
                    ProgressView()
                        .frame(width: imageSize)
                        .onAppear {
                            catsVM.fetchCatData()
                        }
                    
                    .navigationTitle("Cats")
                }
            }
        }
    }
}

struct CatsView_Previews: PreviewProvider {
    static var previews: some View {
        CatsView()
    }
}
