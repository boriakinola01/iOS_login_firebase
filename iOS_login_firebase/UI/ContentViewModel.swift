//
//  ContentViewModel.swift
//  iOS_login_firebase
//
//  Created by Bori Akinola on 14/08/2024.
//

import Foundation

enum AuthState {
    
    case none
    case authenticated
    case notAuthenticated
}

class HomePageViewModel: ObservableObject {
    
    @Published var authState = AuthState.none
    
}
