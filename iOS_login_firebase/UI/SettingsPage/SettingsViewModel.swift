//
//  SettingsViewModel.swift
//  iOS_login_firebase
//
//  Created by Bori Akinola on 21/08/2024.
//

import Combine
import Foundation

class SettingsViewModel: ObservableObject {
    
    private var subscriptions = Set<AnyCancellable>()
    
    @Published private(set) var user: UserEntity? = nil
    
    @MainActor
    func loadCurrentUser() async throws {
        let authUser = try AuthenticationManager.shared.getAuthenticatedUser()
        self.user = try await FirestoreUserService.shared.getUser(userId: authUser.id)
        
        print(user!)
    }
    
    func addListenerForUserProfileUpdates() {
        guard let authUser = try? AuthenticationManager.shared.getAuthenticatedUser() else { return }
        
        FirestoreUserService.shared.addListenerForUserProfileUpdates(userId: authUser.id) { [weak self] userEntity in
            self?.user = userEntity
        }
    }
    
    func logOut() throws {
        try AuthenticationManager.shared.signOut()
    }
}
