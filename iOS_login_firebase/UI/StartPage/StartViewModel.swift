//
//  StartViewModel.swift
//  iOS_login_firebase
//
//  Created by Bori Akinola on 21/08/2024.
//

import Foundation

final class StartViewModel: ObservableObject {
    
    func isSignedIn() -> Bool {
        AuthenticationManager.shared.isUserSignedIn()
    }
}
