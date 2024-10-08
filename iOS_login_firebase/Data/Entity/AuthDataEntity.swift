//
//  AuthDataEntity.swift
//  iOS_login_firebase
//
//  Created by Bori Akinola on 16/08/2024.
//

import Foundation
import FirebaseAuth

struct AuthDataEntity {
    var id: String
    var email: String?
    var photoUrl: String?
    
    init(user: User) {
        self.id = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}
