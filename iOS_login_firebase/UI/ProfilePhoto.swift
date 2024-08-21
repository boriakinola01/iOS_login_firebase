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
                Image(systemName: "person.circle")
                .resizable()
                .frame(width: 32, height: 32)
                .accentColor(.blue)
                .opacity(1)
            }
            
    }
}


