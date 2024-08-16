//
//  ContentView.swift
//  iOS_login_firebase
//
//  Created by Bori Akinola on 14/08/2024.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    LoginView()
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
