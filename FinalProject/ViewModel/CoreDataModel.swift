//
//  DataController.swift
//  FinalProject
//
//  Created by Barath Mohan on 5/1/23.
//

import Foundation
import CoreData

class CoreDataModel: ObservableObject {
    
    @Published var savedUsers: [Users] = []
    let container = NSPersistentContainer(name: "FinalProject")
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Coredata failed to load: \(error.localizedDescription)")
            }
        }
        fetchUsers()
    }
    
    func fetchUsers() {
        let request = NSFetchRequest<Users>(entityName: "Users")
        do {
            savedUsers = try container.viewContext.fetch(request)
            print("Fetching data successfull")
        } catch {
            print("Error Fetching Coredata")
        }
    }
    
    func addUsers(name: String, username: String, password: String, email:String) {
        let user = Users(context: container.viewContext)
        user.email = email
        user.name = name
        user.username = username
        user.password = password
        saveUser()
    }
    
    func deleteUser(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = savedUsers[index]
        container.viewContext.delete(entity)
        saveUser()
    }
    
    func saveUser() {
        do {
            try container.viewContext.save()
            fetchUsers()
            print("User Added Successfully")
        } catch {
            print("Error saving data")
        }
    }
}

