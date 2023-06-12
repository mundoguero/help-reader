//
//  ConvertedText.swift
//  help reader
//
//  Created by Jonatas Brisotti on 12/06/23.
//

import SwiftUI

struct ConvertedTextView: View {
    @State private var isShowingCongrats = false
    let htmlContent: String
    
    var body: some View {
        VStack {
            HTMLView(text: .constant(htmlContent))
                .font(.title)
            
            Button(action: {
                isShowingCongrats = true
            }) {
                Text("Finish")
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
                    .foregroundColor(.white)
                    .font(.headline)
            }
            .sheet(isPresented: $isShowingCongrats) {
                CongratsView()
            }
        }
    }
}
