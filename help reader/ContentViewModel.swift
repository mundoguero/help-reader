//
//  ContentViewModel.swift
//  help reader
//
//  Created by Jonatas Brisotti on 29/05/23.
//

import Foundation

import SwiftUI

class ContentViewModel: ObservableObject {
    @Published var textToConvert: String = "Place the txt here"
    @Published internal var webContent: String = ""
    @Published private var isLoading: Bool = false
    
    func makePOSTRequest() {
        
        let headers = [
            "content-type": "application/x-www-form-urlencoded",
            "X-RapidAPI-Key": "***REMOVED***",
            "X-RapidAPI-Host": "bionic-reading1.p.rapidapi.com"
        ]
        
        //Keep the word 'content=' in the beggining of the string
        let postData = NSMutableData(data: "content=\(textToConvert)".data(using: String.Encoding.utf8)!)
        postData.append("&response_type=html".data(using: String.Encoding.utf8)!)
        postData.append("&request_type=html".data(using: String.Encoding.utf8)!)
        postData.append("&fixation=1".data(using: String.Encoding.utf8)!)
        postData.append("&saccade=10".data(using: String.Encoding.utf8)!)
        
        let request = NSMutableURLRequest(
            url: NSURL(
                string: "https://bionic-reading1.p.rapidapi.com/convert"
            )!
            as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0
        )
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        let cssToAdd =
        """
                                    <style>
                                body {
                                color: blue;
                                font-size: 78px;
                                font-family: "AmericanTypewriter"
                                    } </style>
        """
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                let httpResponseHeader = response as? HTTPURLResponse
                print(httpResponseHeader! as Any)
                print("😜")
                print(postData)
                print(headers)
                if let data = data, let httpResponseBody = String(data: data, encoding: .utf8) {
                    print("Response data string:\n \(httpResponseBody)")
                    DispatchQueue.main.async {
                        self.webContent = httpResponseBody + cssToAdd
                        self.isLoading = false
                    }
                    print(self.webContent)
                }
            }
        })
        dataTask.resume()
        
    }
    
    func textValidation() -> Bool {
        if textToConvert.count >= 3 {
            return true
        }
        return false
    }
}

