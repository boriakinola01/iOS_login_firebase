//
//  ContentView.swift
//  iOS_login_firebase
//
//  Created by Bori Akinola on 14/08/2024.
//

import SwiftUI


struct HomePageView: View {
    
    @StateObject private var viewModel = HomePageViewModel()
    
    
    @Binding var showSignInView: Bool
    
    var body: some View {
        Text("Hi there!")
        
        Spacer(minLength: 0.5)
        
        Button("Log out") {
            Task {
                do {
                    try viewModel.logOut()
                    showSignInView = true
                } catch {
                    print(error)
                }
            }
            print("Logged out.......")
            goHome()
        }
        
        Spacer()
    }
    
    func goHome() {
        
        let scenes = UIApplication.shared.connectedScenes.first as? UIWindowScene
        
        if let window = scenes?.windows.first {
            window.rootViewController = UIHostingController(rootView: LoginView(showSignInView: $showSignInView))
            window.makeKeyAndVisible()
        }
    }
    
}
