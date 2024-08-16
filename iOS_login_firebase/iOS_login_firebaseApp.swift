//
//  iOS_login_firebaseApp.swift
//  iOS_login_firebase
//
//  Created by Bori Akinola on 14/08/2024.
//

import SwiftUI
import Firebase
import FirebaseAuth


class AppDelegate: NSObject, UIApplicationDelegate {
    let util = Util()
    let consts = Constants()
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      
      FirebaseApp.configure()
      print("Firebase configured!")

    return true
  }
}

@main
struct iOS_login_firebaseApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            HomePageView()
        }
    }
}
