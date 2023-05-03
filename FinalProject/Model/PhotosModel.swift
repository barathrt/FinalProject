//
//  PhotosModel.swift
//  FinalProject
//
//  Created by Barath Mohan on 5/3/23.
//

import Foundation

struct PhotosModel: Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
