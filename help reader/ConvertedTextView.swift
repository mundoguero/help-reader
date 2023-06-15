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
    @StateObject private var viewModel = ConvertedTextViewModel()
    
    var body: some View {
        
        VStack {
            HTMLView(text: .constant(htmlContent))
                .font(.title)
                .padding()
            
            HStack {
                
                Button(action: {
                    viewModel.saveAsPDF(htmlContent: htmlContent) { success in
                        isShowingPDFSavedAlert = success
                    }
                }) {
                    Text("Save as PDF")
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(12)
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .padding()
                .alert(isPresented: $isShowingPDFSavedAlert) {
                    Alert(
                        title: Text("PDF Saved"),
                        message: Text("The HTML content has been saved as a PDF file."),
                        dismissButton: .default(Text("OK"))
                    )
                }
                
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
                .padding()
            }
            NavigationLink(destination: CongratsView(), isActive: $isShowingCongratsView) {
                EmptyView()
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Done")
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
