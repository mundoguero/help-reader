////
////  File.swift
////  help reader
////
////  Created by Jonatas Brisotti on 12/05/23.
////
//import Foundation
//
//let headers = [
//    "content-type": "application/x-www-form-urlencoded",
//    "X-RapidAPI-Key": "e96ce2f278msha1d327fbac018e1p12fa9ejsnbc533d5914af",
//    "X-RapidAPI-Host": "bionic-reading1.p.rapidapi.com"
//]
//
//let postData = NSMutableData(data: "content=Mete la borseta nel cassettoneeee 500!".data(using: String.Encoding.utf8)!)
//postData.append("&response_type=html".data(using: String.Encoding.utf8)!)
//postData.append("&request_type=html".data(using: String.Encoding.utf8)!)
//postData.append("&fixation=1".data(using: String.Encoding.utf8)!)
//postData.append("&saccade=10".data(using: String.Encoding.utf8)!)
//
//let request = NSMutableURLRequest(url: NSURL(string: "https://bionic-reading1.p.rapidapi.com/convert")! as URL,
//                                        cachePolicy: .useProtocolCachePolicy,
//                                    timeoutInterval: 10.0)
//request.httpMethod = "POST"
//request.allHTTPHeaderFields = headers
//request.httpBody = postData as Data
//
//let session = URLSession.shared
//let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//    if (error != nil) {
//        print(error as Any)
//    } else {
//        let httpResponse = response as? HTTPURLResponse
//        print(httpResponse! as Any)
//        print(postData)
//        print(headers)
//    }
//})
//
//dataTask.resume()
//
