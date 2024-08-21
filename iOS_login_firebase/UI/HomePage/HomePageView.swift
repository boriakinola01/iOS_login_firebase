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
            }
            
            Spacer()
        }
        .onAppear()
        .navigationHomeScreeView(title: "Welcome ")
    };
    
}
