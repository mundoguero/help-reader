//
//  APICall.swift
//  help reader
//
//  Created by Jonatas Brisotti on 12/05/23.
//

import Foundation

func makePOSTRequest() {
    guard let url = URL(string: "https://bionic-reading1.p.rapidapi.com/convert") else {
        return
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content-type")
    request.setValue("***REMOVED***", forHTTPHeaderField: "X-RapidAPI-Key")
    request.setValue("bionic-reading1.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
    let body = [
        "content": "POST Request from Xcode 10",
        "response_type": "html",
        "request_type": "html",
        //"fixation": 1,
        //"saccade": 10
    ]
    request.httpBody = try? JSONEncoder().encode(body)
    
    let task = URLSession.shared.dataTask(with: request) { data, _, error in
        guard let data = data, error == nil else {
            return
        }
        
        do {
            let response = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
            print("Success: \(response)")
        }
        catch {
            print(error)
        }
        
    }
    task.resume()
}
