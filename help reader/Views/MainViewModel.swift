//
//  ContentViewModel.swift
//  help reader
//
//  Created by Jonatas Brisotti on 29/05/23.
//

import Foundation
import SwiftUI

class MainViewModel: ObservableObject {
    @Published var textToConvert: String = "Place the txt here"
    @Published var webContent: String = ""
    @Published private var isLoading: Bool = false
    
    func generatePostData() -> String {
        let postData = NSMutableData(data: "content=\(textToConvert)".data(using: String.Encoding.utf8)!)
        postData.append("&response_type=html".data(using: String.Encoding.utf8)!)
        postData.append("&request_type=html".data(using: String.Encoding.utf8)!)
        postData.append("&fixation=1".data(using: String.Encoding.utf8)!)
        postData.append("&saccade=10".data(using: String.Encoding.utf8)!)
        return String(decoding: postData, as: UTF8.self)
    }

    func makePOSTRequest() {
        let headers = [
            "content-type": "application/x-www-form-urlencoded",
            "X-RapidAPI-Key": "your-api-key",
            "X-RapidAPI-Host": "bionic-reading1.p.rapidapi.com"
        ]
        
        let postDataString = generatePostData()
        guard let postData = postDataString.data(using: .utf8) else { return }
        
        let request = NSMutableURLRequest(
            url: NSURL(string: "https://bionic-reading1.p.rapidapi.com/convert")! as URL,
            cachePolicy: .useProtocolCachePolicy,
            timeoutInterval: 10.0
        )
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData

        let cssToAdd =
        """
        <style>
        body {
            color: black;
            font-size: 28px;
            font-family: "-apple-system";
        } </style>
        """

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { [weak self] (data, response, error) in
            if let error = error {
                print(error)
                return
            }

            if let httpResponseHeader = response as? HTTPURLResponse {
                print(httpResponseHeader)
                print("😜")
                print(postData)
                print(headers)
                if let data = data, let httpResponseBody = String(data: data, encoding: .utf8) {
                    print("Response data string:\n \(httpResponseBody)")
                    DispatchQueue.main.async {
                        self?.webContent = httpResponseBody + cssToAdd
                        self?.isLoading = false
                    }
                    print(self?.webContent ?? "")
                }
            }
        }
        dataTask.resume()
    }

    func textValidation() -> Bool {
        return textToConvert.count >= 3
    }
}


