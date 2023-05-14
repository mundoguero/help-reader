//
//  ContentView.swift
//  help reader
//
//  Created by Jonatas Brisotti on 12/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var textFieldText: String = ""
    //@Binding var textFieldContent: String
    
    var body: some View {
        VStack {
            
            TextField("Type something here", text: $textFieldText)
                .padding()
                .background(Color.gray.opacity(0.3).cornerRadius(12))
                .font(.headline)
            
            Button(action: {
                makePOSTRequest()
            }, label: {
                Text("Send")
                    .padding()
                    .background(Color.blue.cornerRadius(12))
                    .foregroundColor(.white)
                    .font(.headline)
            })

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
