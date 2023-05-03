//
//  PostViewModel.swift
//  FinalProject
//
//  Created by Barath Mohan on 5/2/23.
//

import Foundation
import Combine

class PostViewModel: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    @Published var posts = [PostModel]()
    private var networkManager = NetworkManager()
    
    func getPostData() {
        
        networkManager.getPostData(endpoint: .posts, type: PostModel.self)
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print("Error is \(err.localizedDescription)")
                case .finished:
                    print("Finished")
                }
            } receiveValue: { [weak self] postsData in
                self?.posts = postsData
            }
            .store(in: &cancellables)
    }
}
