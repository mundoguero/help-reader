//
//  ModalView.swift
//  help reader
//
//  Created by Jonatas Brisotti on 06/06/23.
//

import SwiftUI

struct ModalView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
            NavigationView {
                VStack {
                    NavigationLink(destination:EnglishView()){
                        Text("Language")
                            .font(.title)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .frame(height: 200)
                            .frame(width: 500)
                            .background(Color("Light Blu"))
                            .cornerRadius(10)
                            .shadow(radius:10)
                            .padding(5)
                    }
                    NavigationLink(destination:HistoryView()){
                        Text("History")
                            .font(.title)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .frame(height: 200)
                            .frame(width: 500)
                            .background(Color("Brown"))
                            .cornerRadius(10)
                            .shadow(radius:10)
                            .padding(5)
                    }
                    NavigationLink(destination:ScienceView()){
                        Text("Science")
                            .font(.title)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .frame(height: 200)
                            .frame(width: 500)
                            .background(Color("Green"))
                            .cornerRadius(10)
                            .shadow(radius:10)
                            .padding(5)
                    }
                    NavigationLink(destination:AddMore()){
                        Text("Add More")
                            .font(.title)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .frame(height: 200)
                            .frame(width: 500)
                            .background(Color("Blu"))
                            .cornerRadius(10)
                            .shadow(radius:10)
                            .padding(5)
                    }
                    }
                    .navigationBarItems(trailing:
                                            Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Chiudi")
                    }
                    )
                }
            }
    }


struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}
