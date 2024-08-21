//
//  ProfilePhoto.swift
//  iOS_login_firebase
//
//  Created by Bori Akinola on 21/08/2024.
//

import SwiftUI

struct ProfilePhoto: View {
    
    @EnvironmentObject var startViewModel: StartViewModel
    
    var body: some View {
        
        ZStack {
            NavigationLink(destination: SettingsView(),
                           label: {
                    Image("person.circle")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .opacity(1)
                }
            )
        }
    }
}

