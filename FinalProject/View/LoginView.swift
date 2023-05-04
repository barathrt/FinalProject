//
//  LoginView.swift
//  FinalProject
//
//  Created by Barath Mohan on 5/1/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var username: String = "NeewUser"
    @State private var password: String = "123456"
    @StateObject var loginVM = LoginViewModel()
    @State private var showHomeView = false
    
    var body: some View {
        NavigationStack {
            VStack {
                CustomTextField(placeholder: "username", value: $username)
                CustomTextField(placeholder: "password", value: $password)
                Button {
                    showHomeView = loginVM.shouldUserLogin(username: username, password: password)
                } label: {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemPink))
                        .cornerRadius(10)
                }.padding()
                
                NavigationLink(destination: RegisterUserView()) {
                    Text("Register")
                }
            }
            .navigationTitle("Login")
            .navigationDestination(isPresented: $showHomeView) {
                HomeView()
            }
        }
            
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
