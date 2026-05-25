//
//  Config.swift
//  help reader
//
//  Created by Jonatas Brisotti on 24/05/26.
//

import Foundation

enum Config {
    static var rapidAPIKey: String {
        // Try to load from a local config file first (not in version control)
        if let key = loadFromConfigFile() {
            return key
        }
        
        // Fallback for development (you'll need to set this locally)
        return ""
    }
    
    private static func loadFromConfigFile() -> String? {
        guard let url = Bundle.main.url(forResource: "Secrets", withExtension: "plist"),
              let data = try? Data(contentsOf: url),
              let plist = try? PropertyListSerialization.propertyList(from: data, format: nil) as? [String: String] else {
            return nil
        }
        return plist["RAPIDAPI_KEY"]
    }
}
