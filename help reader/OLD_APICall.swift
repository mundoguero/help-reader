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

//
//  ContentView.swift
//  help reader
//
//  Created by Jonatas Brisotti on 12/05/23.
//

//import SwiftUI
//import WebKit
//
//struct ContentView: View {
//
//    @State var textToConvert: String = "Place the txt here"
//@State private var webContent: String = ""
//@State private var isLoading: Bool = false
//
//    func textValidation() -> Bool {
//           if textToConvert.count >= 3 {
//               return true
//           }
//           return false
//       }
//
//    func makePOSTRequest() {
//        isLoading = true
//        let headers = [
//            "content-type": "application/x-www-form-urlencoded",
//            "X-RapidAPI-Key": "***REMOVED***",
//            "X-RapidAPI-Host": "bionic-reading1.p.rapidapi.com"
//        ]
//
//        //Keep the word 'content=' in the beggining of the string
//        let postData = NSMutableData(data: "content=\(textToConvert)".data(using: String.Encoding.utf8)!)
//        postData.append("&response_type=html".data(using: String.Encoding.utf8)!)
//        postData.append("&request_type=html".data(using: String.Encoding.utf8)!)
//        postData.append("&fixation=1".data(using: String.Encoding.utf8)!)
//        postData.append("&saccade=10".data(using: String.Encoding.utf8)!)
//
//        let request = NSMutableURLRequest(
//            url: NSURL(
//                string: "https://bionic-reading1.p.rapidapi.com/convert"
//            )!
//            as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0
//        )
//        request.httpMethod = "POST"
//        request.allHTTPHeaderFields = headers
//        request.httpBody = postData as Data
//
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//            if (error != nil) {
//                print(error as Any)
//            } else {
//                let httpResponseHeader = response as? HTTPURLResponse
//                print(httpResponseHeader! as Any)
//                print("😜")
//                print(postData)
//                print(headers)
//                if let data = data, let httpResponseBody = String(data: data, encoding: .utf8) {
//                    print("Response data string:\n \(httpResponseBody)")
//                    DispatchQueue.main.async {
//                        webContent = httpResponseBody
//                        isLoading = false
//                    }
//                }
//            }
//        })
//        dataTask.resume()
//    }
//
//    var body: some View {
//        VStack {
//
//            TextEditor(text: $textToConvert)
//                .frame(width: 350, height: 200)
//                .padding()
//                .background(Color.gray.opacity(0.3).cornerRadius(12))
//                .font(.headline)
//
//            Button(action: {
//                if textValidation() {
//                    makePOSTRequest()
//                }
//
//                textToConvert = ""
//            }, label: {
//                Text("Send")
//                    .padding()
//                    .background(textValidation() ? Color.blue : Color.gray)
//                    .cornerRadius(12)
//                    .foregroundColor(.white)
//                    .font(.headline)
//            })
//            .disabled(!textValidation())
//        }
//        Text("\(textToConvert)")
//        .padding()
//
//        HTMLView(text: $webContent)
//          .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
//
//        Spacer()
//    }
//}
//
//struct HTMLView: UIViewRepresentable {
//  @Binding var text: String
//
//  func makeUIView(context: Context) -> WKWebView {
//    return WKWebView()
//  }
//
//  func updateUIView(_ uiView: WKWebView, context: Context) {
//    uiView.loadHTMLString(text, baseURL: nil)
//  }
//}
