//
//  ConvertedText.swift
//  help reader
//
//  Created by Jonatas Brisotti on 12/06/23.
//

import SwiftUI
import UIKit


struct ConvertedTextView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let htmlContent: String
    @State private var isShowingCongratsView = false
    @State private var isShowingPDFSavedAlert = false
    @StateObject private var viewModel = ConvertedTextViewModel(content: "")
    
    init(htmlContent: String) {
            self.htmlContent = htmlContent
            self._viewModel = StateObject(wrappedValue: ConvertedTextViewModel(content: htmlContent))
        }
    
    var body: some View {
        
        VStack {
            HTMLView(text: .constant(htmlContent))
                .font(.title)
                .padding()
            
            HStack {
                
                ShareLink("Export PDF", item: viewModel.render())
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
                    .foregroundColor(.white)
                    .font(.headline)
                
//                Button(action: {
//                                    let pdfURL = viewModel.render()
//                                    sharePDF(pdfURL)
//                                }) {
//                                    Text("Save as PDF")
//                                        .padding()
//                                        .background(Color.blue)
//                                        .cornerRadius(12)
//                                        .foregroundColor(.white)
//                                        .font(.headline)
//                                }
                
                Button(action: {
                    isShowingCongratsView = true
                }) {
                    Text(LocalizedStringKey("Finish"))
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(12)
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .padding()
            }
        }
        .navigationDestination(isPresented: $isShowingCongratsView) {
            CongratsView()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text(LocalizedStringKey("Done"))
                }
            }
        }
    }
}


struct Previews_ConvertedTextView_Previews: PreviewProvider {
    static var previews: some View {
        HTMLView(text: .constant("Teste"))
    }
}
