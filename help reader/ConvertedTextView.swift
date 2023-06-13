//
//  ConvertedText.swift
//  help reader
//
//  Created by Jonatas Brisotti on 12/06/23.
//

import SwiftUI

struct ConvertedTextView: View {
    
    let htmlContent: String
    @State private var isShowingCongratsView = false
    
    var body: some View {
        VStack {
            HTMLView(text: .constant(htmlContent))
                .font(.title)
            
            Button(action: {
                isShowingCongratsView = true
            }) {
                Text("Finish")
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
                    .foregroundColor(.white)
                    .font(.headline)
            }
            NavigationLink(destination: CongratsView(), isActive: $isShowingCongratsView) {
                            EmptyView()
                        }
            .hidden()
        }
    }
}
