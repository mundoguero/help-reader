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
    
    @Binding var text: String
    
    //let htmlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        //let webView =  WKWebView()
        //let request = URLRequest(url: url)
        //webView.load(request)
        return WKWebView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.loadHTMLString(text, baseURL: nil)
    }
    
}

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
