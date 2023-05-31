//
//  BookView.swift
//  help reader
//
//  Created by Lara on 31/05/23.
//

import SwiftUI

struct BookView: View {
    let text: String
    let pageSize: Int
    
    @State private var currentPage: Int = 1
    
    var totalPages: Int {
        let pageCount = text.count / pageSize
        return (text.count % pageSize == 0) ? pageCount : pageCount + 1
    }
    
    var body: some View {
        
        ZStack {
            VStack {
                Spacer()
                Text(getPageText())
                    .font(.system(size: 32, weight: .regular)) // Increase font size
                // .padding(.horizontal, 30) // Adjust horizontal padding
                // .padding(.vertical, 50) // Adjust vertical padding
                    .multilineTextAlignment(.leading) // Align text to leading
                    .lineSpacing(20) // Increase line spacing
                    .padding()
                
                Spacer()
            }
            .frame(maxWidth: 800, maxHeight: .infinity, alignment: .center)
            
            VStack {
                Spacer()
                
                ProgressView(value: Double(currentPage), total: Double(totalPages))
                    .padding(.horizontal)
                
                Text("Pages Left: \(totalPages - currentPage)")
                    .font(.footnote)
                
            }
        }
        .overlay(
            Rectangle()
                .opacity(0.001)
                .contentShape(Rectangle())
                .gesture(
                    DragGesture(minimumDistance: 100)
                        .onEnded { value in
                            if value.translation.width < 0 {
                                nextPage()
                            } else if value.translation.width > 0 {
                                previousPage()
                            }
                        }
                )
            
        )
    }
    
    func getPageText() -> String {
        let start = (currentPage - 1) * pageSize
        let end = min(start + pageSize, text.count)
        let startIndex = text.index(text.startIndex, offsetBy: start)
        let endIndex = text.index(text.startIndex, offsetBy: end)
        return String(text[startIndex..<endIndex])
    }
    
    func nextPage() {
        if currentPage < totalPages {
            currentPage += 1
        }
    }
    
    func previousPage() {
        if currentPage > 1 {
            currentPage -= 1
        }
    }
    
   
    
}

