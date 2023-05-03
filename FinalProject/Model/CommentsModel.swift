//
//  CommentsModel.swift
//  FinalProject
//
//  Created by Barath Mohan on 5/3/23.
//

import Foundation

struct CommentsModel: Codable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
