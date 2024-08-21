//
//  SettingsView.swift
//  iOS_login_firebase
//
//  Created by Bori Akinola on 21/08/2024.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showSignInView: Bool
    
    
    var body: some View {
        
        List {
            
            if let user = viewModel.user {
                Text("ID: \(user.id)")
                
                Text("Name: \(user.firstName) \(user.lastName)")
                Text("Email: \(user.email!)")
                Text("Age: \(user.age)")
            }
            
            Button("Log out") {
                Task {
                    do {
                        try viewModel.logOut()
                        showSignInView = true
                    } catch {
                        print(error)
                    }
                }
                print("Logged out.......")
            }
            .font(.headline)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .background(Color.blue)
            .cornerRadius(10)
        }
        .task{
            try? await viewModel.loadCurrentUser()
        }
        
        
    }
}
