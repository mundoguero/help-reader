//
//  ContentView.swift
//  help reader
//
//  Created by Jonatas Brisotti on 12/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var textToConvert: String = "Place the txt here"
    //@State var httpResponse: String = ""
    
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
                   }
           }
       })
       dataTask.resume()
    }
    
    var body: some View {
        VStack {
            
            TextEditor(text: $textToConvert)
                .frame(width: 350, height: 200)
                .padding()
                .background(Color.gray.opacity(0.3).cornerRadius(12))
                .font(.headline)
            
            Button(action: {
                if textValidation() {
                    makePOSTRequest()
                }
                
                textToConvert = ""
            }, label: {
                Text("Send")
                    .padding()
                    .background(textValidation() ? Color.blue : Color.gray)
                    .cornerRadius(12)
                    .foregroundColor(.white)
                    .font(.headline)
            })
            .disabled(!textValidation())
        }
        Text("\(textToConvert)")
        .padding()
        Spacer()
    }
    
    func textValidation() -> Bool {
        if textToConvert.count >= 3 {
            return true
        }
        return false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
