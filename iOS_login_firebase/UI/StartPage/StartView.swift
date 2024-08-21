//
//  StartView.swift
//  iOS_login_firebase
//
//  Created by Bori Akinola on 15/08/2024.
//

import SwiftUI

struct StartView: View {
    
    @State private var showSignInView: Bool = false
    @StateObject private var viewModel = StartViewModel()
    
    var body: some View {
        
        ZStack {
            if !showSignInView {
                NavigationStack {
                    HomePageView(showSignInView: $showSignInView)
                }
            }
        }
        .onAppear {
            self.showSignInView = !viewModel.isSignedIn()
        }
        .fullScreenCover(isPresented: $showSignInView){
            NavigationStack {
                LoginView(showSignInView: $showSignInView)
            }
        }
        
    }
}
