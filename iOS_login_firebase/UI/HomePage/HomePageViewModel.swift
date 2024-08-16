//
//  HomePageViewModel.swift
//  iOS_login_firebase
//
//  Created by Bori Akinola on 16/08/2024.
//

import Foundation

final class HomePageViewModel: ObservableObject {
    
    func logOut() throws {
        try AuthenticationManager.shared.signOut()
    }
}
