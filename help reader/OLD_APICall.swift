//
//  APICall.swift
//  help reader
//
//  Created by Jonatas Brisotti on 12/05/23.
//

//import Foundation
//
//func makePOSTRequest() {
//
//    guard let url = URL(string: "https://bionic-reading1.p.rapidapi.com/convert") else {
//        return
//    }
//
//    var request = URLRequest(url: url)
//
//    //Method, body params, header params
//    request.httpMethod = "POST"
//    request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content-type")
//    request.setValue("***REMOVED***", forHTTPHeaderField: "X-RapidAPI-Key")
//    request.setValue("bionic-reading1.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
//    let body: [String: Any] = [
//        "content": "Post Request from xcode 20",
//        "response_type": "html",
//        "request_type": "html",
//        "fixation": 1,
//        "saccode": 10
//    ]
//            guard let httpBody = try? JSONSerialization.data(withJSONObject: body) else {
//                fatalError("Error while converting parameters to JSON data")
//            }
    
    //request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
    //request.httpBody = try? JSONEncoder().encode(httpBody)
    
    //Make the request
//    let task = URLSession.shared.dataTask(with: request) { data, _, error in
//        guard let data = data, error == nil else {
//            return
//        }
//        
//        do {
//            let response = try JSONSerialization.jsonObject(with: data)
//            print ("Success: \(response)")
//        }
//        catch let error {
//            print(error.localizedDescription)
//        }
//    }
//    task.resume()
//}
                
                //    let task = URLSession.shared.dataTask(with: request) { data, _, error in
                //        guard let data = data, error == nil else {
                //            return
                //        }
                //
                //        do {
                //            let response = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
                //            print("Success: \(response)")
                //        }
                //        catch {
                //            print(error)
                //        }
                //
                //    }
                //    task.resume()
            
            
//            do {
//                        //create json object from data
//                        guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
//                            return
//                        }
//                        print(json)
//                        completion(json, nil)
//                    } catch let error {
//                        print(error.localizedDescription)
//                    }
//
