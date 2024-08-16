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
}
