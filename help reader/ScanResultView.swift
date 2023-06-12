//
//  ScanResultView.swift
//  help reader
//
//  Created by Jonatas Brisotti on 06/06/23.
//

import SwiftUI

struct ScanResultView: View {
    @Binding var scanResult: String
    @StateObject private var viewModel = ContentViewModel()
    @State private var showCameraScannerView = false
    @State private var isShowingConvertedText = false
        @State private var convertedHTMLContent = ""
    @Environment(\.presentationMode) var presentationMode // Add this line
    
    @State private var resultTextView = false // Add this line
    
    
    var body: some View {
        VStack {
            Text(scanResult)
                .font(.body)
            
            HStack {
                Button(action: {
                    showCameraScannerView = true
                }, label: {
                    Text("Retake")
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(12)
                        .foregroundColor(.white)
                        .font(.headline)
                })
                .sheet(isPresented: $showCameraScannerView) {
                    CameraScanner(startScanning: $showCameraScannerView, scanResult: $viewModel.textToConvert)
                        .onDisappear {
                            presentationMode.wrappedValue.dismiss()
                        }
                }
                
                Button(action: {
                    viewModel.textToConvert = scanResult
                    viewModel.makePOSTRequest()
                }, label: {
                    Text("Convert")
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(12)
                        .foregroundColor(.white)
                        .font(.headline)
                })
            }
            //HTMLView(text: $viewModel.webContent)
            NavigationLink(destination: ConvertedTextView(htmlContent: convertedHTMLContent), isActive: $isShowingConvertedText) {
                            EmptyView()
                        }
            .hidden()
        }
        .onChange(of: viewModel.webContent) { newValue in
            convertedHTMLContent = newValue
            isShowingConvertedText = !newValue.isEmpty
        }
    }
    
}

struct ScanResultView_Previews: PreviewProvider {
    static var previews: some View {
        let scanResult = Binding<String>.constant("Example Scan Result")
        
        return ScanResultView(scanResult: scanResult)
    }
}
