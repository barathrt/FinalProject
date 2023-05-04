//
//  CatsViewModel.swift
//  FinalProject
//
//  Created by Barath Mohan on 5/4/23.
//

import Foundation
import Combine

class CatsViewModel: ObservableObject {
    
    var limit = 10
    @Published var catImages = [CatsModel]()
    private let networkManager = NetworkManager()
    private var cancellables = Set<AnyCancellable>()
    
    func fetchCatData() {
        networkManager.getCatImages(type: CatsModel.self, limit: limit)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Cats data fetched")
                case .failure(let err):
                    print("Cats failed \(err.localizedDescription)")
                }
            } receiveValue: { [weak self] catsData in
                self?.catImages = catsData
            }
            .store(in: &cancellables)
    }
    
}
