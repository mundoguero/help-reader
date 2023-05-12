//
//  NetworkManager.swift
//  help reader
//
//  Created by Jonatas Brisotti on 12/05/23.
//
import Foundation

class NetworkManager : ObservableObject {
    
    func convertText() {
        guard let url = URL(string: "https://bionic-reading1.p.rapidapi.com/convert") else {
            print("Invalid URL")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content-type")
        request.addValue("X-RapidAPI-Key", forHTTPHeaderField: "e96ce2f278msha1d327fbac018e1p12fa9ejsnbc533d5914af")
        request.addValue("X-RapidAPI-Host", forHTTPHeaderField: "bionic-reading1.p.rapidapi.com")
        
        do {
             
        }
    }
    
}
