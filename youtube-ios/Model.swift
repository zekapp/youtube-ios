//
//  Model.swift
//  youtube-ios
//
//  Created by Zeki Guler on 28/9/20.
//

import Foundation

class Model {
    func getVideos() {
        
        // create a URL object
        let url = URL(string:  Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // check if there were any errors
            if error != nil || data == nil {
                return
            }
            
            // parsing
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(Response.self, from: data!)
                dump(response)
            } catch {
                
            }
            
            
        }
        
        dataTask.resume()
        
    }
}
