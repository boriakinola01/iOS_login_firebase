//
//  LoginViewModel.swift
//  iOS_login_firebase
//
//  Created by Bori Akinola on 16/08/2024.
//

import Foundation

final class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    
    func signIn() {
        
//      Include some validation for email and passwowrd authentications here
//
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or passowrd found.")
            return
        }
        
        
        Task {
            do {
                let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
                print("Success")
                print(returnedUserData)
            } catch {
                print("Error: \(error)")
            }
        }
        
    }
}

