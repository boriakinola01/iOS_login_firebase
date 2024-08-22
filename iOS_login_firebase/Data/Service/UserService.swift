//
//  UserService.swift
//  iOS_login_firebase
//
//  Created by Bori Akinola on 21/08/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreCombineSwift


final class UserManager {
    
    static let shared = UserManager()
    private init() { }
    
    private let userCollection = Firestore.firestore().collection("user")
    
    private func getUserDocument(userId: String) -> DocumentReference {
        userCollection.document(userId)
    }
    
    func createNewUser(user: UserEntity) async throws {
        _ = getUserDocument(userId: user.id)
            .setData(from: user, merge: false)
    }
    
//    func createNewUser(auth: AuthDataEntity) async throws {
//        
//        let userData = UserEntity (
//            id: auth.id,
//            firstName: "",
//            lastName: "",
//            age: 23,
//            email: auth.email)
//        
//        
//        try await getUserDocument(userId: auth.id)
//            .setData(userData.toDictionary()!, merge: false)
//    }
    
    func getUser(userId: String) async throws -> UserEntity {
        try await getUserDocument(userId: userId).getDocument(as: UserEntity.self)
    }
    
}
