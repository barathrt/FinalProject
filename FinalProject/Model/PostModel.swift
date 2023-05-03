//
//  PostModel.swift
//  FinalProject
//
//  Created by Barath Mohan on 5/2/23.
//

import Foundation

struct PostModel: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
