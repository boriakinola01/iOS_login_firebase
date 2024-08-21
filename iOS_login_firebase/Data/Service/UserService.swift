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
    
    func createNewUser(auth: AuthDataEntity) async throws {
        
        let userData = UserEntity (
            id: auth.id,
            firstName: "",
            lastName: "",
            age: 23,
            email: auth.email)
        
        
        try await Firestore.firestore().collection("user")
            .document(auth.id)
            .setData(userData.toDictionary()!, merge: false)
    }
    
    
    func getUser(userId: String) async throws -> UserEntity {
        var resultUser = UserEntity()
        
        let document = Firestore.firestore().collection("user")
            .document(userId)
        
        print(document)
        
        do {
            return try await document.getDocument(as: UserEntity.self)
        } catch {
            print("Cannot initialize a userEntity object from the snapshot!!!")
        }
//         { result in
//            switch result {
//            case .success(let user):
//                  return user
//                case .failure(let error):
//                  print("Cannot initialize a userEntity object from the snapshot!!!")
//            }
//        }
        
        return resultUser
    }
}
