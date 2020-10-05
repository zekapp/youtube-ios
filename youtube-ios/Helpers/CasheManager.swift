//
//  CasheManager.swift
//  youtube-ios
//
//  Created by Zeki Guler on 5/10/20.
//

import Foundation

class CasheManager {
    
    static var cacheDictionary = [String:Data]()
    
    
    static func setVideoCache(_ url:String, _ data:Data?) {
        
        // Store the image data and use the url as the key
        cacheDictionary[url] = data
    }
    
    static func getVideoCache(_ url:String) -> Data? {
        // Try to get the data for
        
        return cacheDictionary[url]
    }
}
