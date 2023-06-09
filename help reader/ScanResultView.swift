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
    
    var body: some View {
        VStack {
            Text(scanResult)
                .font(.body)
            HStack {
                Button(action: {
                    
                }, label: {
                    Text("Retake")
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(12)
                        .foregroundColor(.white)
                        .font(.headline)
                })
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
                HTMLView(text: $viewModel.webContent)
        }
    }
}

struct ScanResultView_Previews: PreviewProvider {
    static var previews: some View {
        let scanResult = Binding<String>.constant("Example Scan Result")
        
        return ScanResultView(scanResult: scanResult)
    }
}
