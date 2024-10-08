//
//  DI+Others.swift
//  iOS_login_firebase
//
//  Created by Bori Akinola on 22/08/2024.
//

import Foundation
import Factory
import Firebase
import FirebaseAuth
import FirebaseFirestore

extension Container {
    var userDefaults: Factory<UserDefaults> {
        Factory(self) { UserDefaults.standard }.singleton
    }
    
    var authRepo: Factory<AuthRepository> {
        Factory(self) { AuthRepository() }.singleton
    }
    
    var userRepo: Factory<UserRepository> {
        Factory(self) { UserRepository() }.singleton
    }
}
