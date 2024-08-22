//
//  Util.swift
//  iOS_login_firebase
//
//  Created by Bori Akinola on 22/08/2024.
//

import Foundation


enum DatabaseError: Error {
    case databaseNotReacheable
    case documentNotFound
    case documentNotSerialized
}

extension UserDefaults {
    @objc var activeUserId: String? {
        get {
            guard let id = self.object(forKey: Constants.UserDefault.activeUserIdKey.rawValue) as? String else { return nil }
            
            return id
        }
        
        set {
            if newValue == nil {
                self.removeObject(forKey: Constants.UserDefault.activeUserIdKey.rawValue)
            } else {
                set(newValue, forKey: Constants.UserDefault.activeUserIdKey.rawValue)
            }
        }
    }
}

class Constants {
    
    enum UserDefault: String, CaseIterable {
        case activeUserIdKey = "activeUserIdKey"
    }
}
