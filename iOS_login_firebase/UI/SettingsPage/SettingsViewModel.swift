//
//  SettingsViewModel.swift
//  iOS_login_firebase
//
//  Created by Bori Akinola on 21/08/2024.
//

import Foundation


class SettingsViewModel: ObservableObject {
    
//    @Published private(set) var user: AuthDataEntity? = nil
    @Published private(set) var user: UserEntity? = nil
    
    @MainActor
    func loadCurrentUser() async throws {
        let authUser = try AuthenticationManager.shared.getAuthenticatedUser()
        self.user = try await UserManager.shared.getUser(userId: authUser.id)
        
        print(user!)
    }
    
    func logOut() throws {
        try AuthenticationManager.shared.signOut()
    }
}
