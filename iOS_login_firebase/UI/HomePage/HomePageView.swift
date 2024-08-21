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
        ZStack{
        
            Text("Hi there!")
            
            Spacer()

        }
        .onAppear()
        .toolbar {
            
            ToolbarItem(placement: .principal) {
                Text("Home Page").scaledToFit()
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    SettingsView(showSignInView: $showSignInView)
                } label: {
                    ProfilePhoto()
                }
            }
        }
        //.navigationHomeScreeView(title: "Welcome ", showSignInView: showSignInView)
    };
    
}
