//
//  LoginView.swift
//  ClickerGame
//
//  Created by Benjamin Nærø on 25/12/2023.
//

import SwiftUI
import SwiftData

struct LoginView: View {
    @EnvironmentObject var authManager: AuthManager
    @State private var username: String = ""
    @State private var password: String = ""
    
    @Environment(\.modelContext) var context
    @State private var isShowingItemSheet = false
    @Query private var users: [User] = []
    
    @State private var showAlert: Bool = false
    @State private var showSheet: Bool = false
    
    var body: some View {
        VStack {
            Text("Clicker Game")
                .font(.largeTitle)
                .bold()
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            Button {
                authManager.login(username: username, password: password)
                showAlert = true
            } label: {
                Text("Login")
                    .padding(.horizontal, 30)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.regular)
            
            
            HStack {
                Text("Don't have an account?")
                Button("Register here") {
                    showSheet = true
                }
            }
            
            .padding()
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("Login Successful"))
            })
            .sheet(isPresented: $showSheet, content: {
                AddUserSheet()
            })
            
        }
    }
}


#Preview {
    LoginView()
}


struct AddUserSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) var context
    
    @State private var userName: String = ""
    @State private var password: String = ""
    
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Username", text: $userName)
                SecureField("Password", text: $password)
                
            }
            .navigationTitle("New Account")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") {
                        let user = User(userName: userName, password: password)
                        context.insert(user)
                        
                        try! context.save()
                        dismiss()
                    }
                }
                
            }
        }
    }
}
