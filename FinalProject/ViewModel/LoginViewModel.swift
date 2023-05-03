//
//  LoginViewModel.swift
//  FinalProject
//
//  Created by Barath Mohan on 5/2/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    var dataController = CoreDataModel()
    
    func shouldUserLogin(username: String, password: String) -> Bool {
        dataController.fetchUsers()
        for user in dataController.savedUsers where user.username == username {
            if user.password == password {
                return true
            }
        }
        return false
    }
}
