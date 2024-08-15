//
//  Util.swift
//  iOS_login_firebase
//
//  Created by Bori Akinola on 15/08/2024.
//

import Foundation
class Util {
    
    func editPlistValue(plistPath: String, key: String, newValue: String) -> Bool {
        // Load the plist file into a dictionary
        guard let plistData = FileManager.default.contents(atPath: plistPath),
              var plistDict = try? PropertyListSerialization.propertyList(from: plistData, options: [], format: nil) as? [String: Any] else {
            print("Failed to load plist file.")
            return false
        }
        
        // Check if the key exists
        if plistDict[key] != nil {
            // Update the value for the specified key
            plistDict[key] = newValue
            do {
                // Convert the dictionary back to plist data
                let updatedPlistData = try PropertyListSerialization.data(fromPropertyList: plistDict, format: .xml, options: 0)
                
                // Write the updated plist data back to the file
                try updatedPlistData.write(to: URL(fileURLWithPath: plistPath))
                
                print("Successfully updated the value for key: \(key)")
                return true
            } catch {
                print("Failed to write updated plist data: \(error)")
                return false
            }
        } else {
            print("Key \(key) not found in plist.")
            return false
        }
    }
}
