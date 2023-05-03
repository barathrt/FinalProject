//
//  FinalProjectApp.swift
//  FinalProject
//
//  Created by Barath Mohan on 5/1/23.
//

import SwiftUI

@main
struct FinalProjectApp: App {
    
//    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
//            LoginView()
            PhotosView()
//                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
