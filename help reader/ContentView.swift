//
//  ContentView.swift
//  help reader
//
//  Created by Jonatas Brisotti on 12/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    
    
    var body: some View {
        VStack {
            
            TextEditor(text: $viewModel.textToConvert)
                .frame(width: 350, height: 200)
                .padding()
                .background(Color.gray.opacity(0.3).cornerRadius(12))
                .font(.headline)
            
            Button(action: {
                if viewModel.textValidation() {
                    viewModel.makePOSTRequest()
                }
                viewModel.textToConvert = ""
            }, label: {
                Text("Send")
                    .padding()
                    .background(viewModel.textValidation() ? Color.blue : Color.gray)
                    .cornerRadius(12)
                    .foregroundColor(.white)
                    .font(.headline)
            })
            .disabled(!viewModel.textValidation())
        }
        
        Text("\(viewModel.textToConvert)")
            .padding()
        HTMLView(text: $viewModel.webContent)
        
        Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
