//
//  AuthenticationManager.swift
//  iOS_login_firebase
//
//  Created by Bori Akinola on 16/08/2024.
//

import Foundation
import FirebaseAuth

final class AuthenticationManager {
    static let shared = AuthenticationManager()
    private init() { }
    
    func createUser(email: String, password: String) async throws -> AuthDataEntity{
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return  AuthDataEntity(user: authDataResult.user)
    }
    
    func signInUser(email: String, password: String) async throws -> AuthDataEntity{
        let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
        return  AuthDataEntity(user: authDataResult.user)
    }
    
    func getAuthenticatedUser() throws  -> AuthDataEntity {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        
        return AuthDataEntity(user: user)
    }
    
    func isUserSignedIn() -> Bool {
        let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
        
        if (authUser != nil) {
            print("User authenticated")
        } else {
            print("User not authenticated")
        }
        
        return authUser != nil
    }
    
    func signOut() throws {
       try Auth.auth().signOut()
    }
}
