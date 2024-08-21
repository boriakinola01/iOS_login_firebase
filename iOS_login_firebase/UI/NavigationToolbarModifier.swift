//
//  NavigationView.swift
//  iOS_login_firebase
//
//  Created by Bori Akinola on 21/08/2024.
//

import SwiftUI

enum NavigationBarItem {
    static var empty: some View {
        EmptyView()
    }
    
    static var homeText: some View {
        Text("Home Page")
            .scaledToFit()
    }
    
    static var profilePhoto: some View {
        ProfilePhoto()
    }
    
    static func close() -> some View {
        Button(
            action: {print("Button pressed!!!")},
            label: {
                Image("back")
            }
        )
    }
    
}

extension View {
    
    @ViewBuilder
    func navigationHomeScreeView(title: String? = nil, showSignInView: Bool) -> some View {
        self.modifier(NavigationHomeScreenViewModifier(title: title))
    }
}

struct NavigationHomeScreenViewModifier: ViewModifier {
    
    var title: String?
    
    func body(content: Content) -> some View {
        NavigationView {
            content
                .navigationTitle(title ?? "")
                .toolbar {
                    toolbarItems(
                        leadingItem: NavigationBarItem.empty,
                        centerItem: NavigationBarItem.homeText,
                        trailingItem: NavigationBarItem.profilePhoto)
                }
        }
    }
    
}


@ToolbarContentBuilder
func toolbarItems<L: View, C: View,T: View>(leadingItem: L, centerItem: C, trailingItem: T) -> some ToolbarContent {
    
    ToolbarItem(placement: .navigationBarLeading) {
        leadingItem
    }
    
    ToolbarItem(placement: .principal){
        centerItem
    }
    
    ToolbarItem(placement: .navigationBarTrailing) {
        trailingItem
    }
}
