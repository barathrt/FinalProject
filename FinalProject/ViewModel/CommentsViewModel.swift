//
//  CommentsViewModel.swift
//  FinalProject
//
//  Created by Barath Mohan on 5/3/23.
//

import Foundation
import Combine

class CommentsViewModel: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    @Published var commentsData = [CommentsModel]()
    private var networkManager = NetworkManager()
    
    func getCommentsData(postID: Int) {
        networkManager.getPostComments(endpoint: .comments, type: CommentsModel.self)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Comments data retreived successfully")
                case .failure(let err):
                    print(err.localizedDescription)
                }
            } receiveValue: { [weak self] comments in
                self?.commentsData = comments.filter({$0.postId == postID})
            }
            .store(in: &cancellables)
        
    }
}
