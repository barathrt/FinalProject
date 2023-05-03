//
//  PhotosViewModel.swift
//  FinalProject
//
//  Created by Barath Mohan on 5/3/23.
//

import Foundation
import Combine

class PhotosViewModel: ObservableObject {
    
    @Published var photoAlbum = [PhotosModel]()
    private let networkManager = NetworkManager()
    private var cancellables = Set<AnyCancellable>()
    
    func getPhotoAlbum() {
        networkManager.getImageAlbum(endpoint: .photos, type: PhotosModel.self)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Photos data fetched successfully")
                case .failure(let err):
                    print(err.localizedDescription)
                }
            } receiveValue: { [weak self] photosData in
                self?.photoAlbum = photosData
            }
            .store(in: &cancellables)

    }
}
