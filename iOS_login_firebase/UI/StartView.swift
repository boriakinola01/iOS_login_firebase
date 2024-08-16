//
//  StartView.swift
//  iOS_login_firebase
//
//  Created by Bori Akinola on 15/08/2024.
//

import SwiftUI

struct StartView: View {
    
    @State private var showSignInView: Bool = false
    
    var body: some View {
        
        ZStack {
            HomePageView(showSignInView: $showSignInView)
        }
        .onAppear {
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            
            if (authUser != nil) {
                print("User authenticated")
            } else {
                print("User not authenticated")
            }
            
            self.showSignInView = authUser == nil
        }
        .fullScreenCover(isPresented: $showSignInView){
            NavigationView {
                VStack {
                    NavigationLink {
                        LoginView(showSignInView: $showSignInView)
                    } label: {
                        Text("Sign in with Email")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 60)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
                .padding()
                .navigationTitle("Home")
            }
        }
        
    }
}
