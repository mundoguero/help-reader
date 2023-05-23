//
//  HTMLView.swift
//  help reader
//
//  Created by Jonatas Brisotti on 18/05/23.
//

import Foundation
import SwiftUI
import WebKit

struct HTMLView: UIViewRepresentable {
    
    let htmlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        //let webView =  WKWebView()
        //let request = URLRequest(url: url)
        //webView.load(request)
        return WKWebView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.loadHTMLString(htmlString, baseURL: nil)
    }
    
}
