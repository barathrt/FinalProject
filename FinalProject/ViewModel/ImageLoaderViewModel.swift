//
//  ImageLoaderViewModel.swift
//  FinalProject
//
//  Created by Barath Mohan on 5/4/23.
//

import Foundation
import UIKit

class ImageLoaderViewModel: ObservableObject {
    let url: String?
    @Published var image: UIImage? = nil
    @Published var errorMessage: String? = nil
    @Published var isLoading: Bool = false
    
    init(url: String?) {
        self.url = url
    }
    
    func fetch() {
        
        guard image == nil && !isLoading else {
            return
        }
        
        guard let url = url, let fetchURL = URL(string: url) else {
            errorMessage = NetworkError.invalidURL.localizedDescription
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        let request = URLRequest(url: fetchURL, cachePolicy: .returnCacheDataElseLoad)
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let error = error {
                    self?.errorMessage = error.localizedDescription
                } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                    self?.errorMessage = NetworkError.responseError.localizedDescription
                } else if let data = data, let image = UIImage(data: data) {
                    print(data)
                    self?.image = image
                } else {
                    self?.errorMessage = NetworkError.unknown.localizedDescription
                }
            }
         }
        task.resume()
    }
}
