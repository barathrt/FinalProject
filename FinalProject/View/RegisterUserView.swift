//
//  RegisterUserView.swift
//  FinalProject
//
//  Created by Barath Mohan on 5/1/23.
//

import SwiftUI

struct RegisterUserView: View {
//    @FetchRequest(sortDescriptors: []) var users: FetchedResults<Users>
//    @Environment(\.managedObjectContext) var moc
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var email: String = ""
    @State private var name: String = ""
    @StateObject var dataController = CoreDataModel()
    
    var body: some View {
        NavigationView {
            VStack {
                CustomTextField(placeholder: "name", value: $name)
                CustomTextField(placeholder: "email", value: $email)
                CustomTextField(placeholder: "username", value: $username)
                CustomTextField(placeholder: "password", value: $password)
                
                
                Button("Register") {
                    dataController.addUsers(name: name, username: username, password: password, email: email)
                }
            }
        }.navigationTitle("Register")
    }
}

struct RegisterUserView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterUserView()
    }
}

struct CustomTextField: View {
    @State var placeholder: String
    @Binding var value: String
    var body: some View {
        TextField(placeholder, text: $value)
            .padding(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.gray, lineWidth: 0.5)
            }
            .padding(.horizontal)
    }
}
