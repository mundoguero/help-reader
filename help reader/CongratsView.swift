//
//  CongratsView.swift
//  help reader
//
//  Created by Jonatas Brisotti on 09/06/23.
//

import SwiftUI

struct CongratsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack {
            Spacer(minLength: 50)
            
            Button {
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 17)
                        .frame(height: 400)
                        .foregroundColor(Color(red: 116 / 255, green: 224 / 255, blue: 255 / 255))
                        .shadow(radius: 2, y: 5)
                        .padding()
                    VStack {
                        Text("Great!")
                            .font(.custom("SF Pro Rounded", size: 56))
                            .frame(width: 200, height: 30)
                            .fontWeight(.bold)
                            .foregroundColor(Color("FontColor"))
                            .padding(.top, 5)
                        LottieView(animationName: "applauso")
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 630, height: 330)
                            .clipped()
                            .padding(-15)
                            .cornerRadius(17)
                    }
                    
                    
                }
            }.padding(.horizontal, 0)
            
            Spacer(minLength: 25)
            
            HStack(spacing: 30) {
                ZStack {
                    RoundedRectangle(cornerRadius: 17)
                        .foregroundColor(Color(red: 153 / 255, green: 190 / 255, blue: 221 / 255))
                        .shadow(radius: 2, y: 5)
                    //.frame(width: 310, height: 390)
                        .padding()
                    
                    
                    VStack {
                        Text("Repeat")
                            .font(.custom("SF Pro Rounded", size: 56))
                            .fontWeight(.heavy)
                            .foregroundColor(Color("FontColor"))
                            .frame(width: 250, height: 140)
                        //.background()
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                            .padding(.bottom, -5.0)
                        Image(systemName: "gobackward")
                            .resizable()
                            .frame(width: 200, height: 200)
                            .foregroundColor(Color(.white))
                        
                    }.padding()
                    Spacer(minLength: 25)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 17)
                        .foregroundColor(Color(red: 153 / 255, green: 190 / 255, blue: 221 / 255))
                        .shadow(radius: 2, y: 5)
                        .padding()
                    
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        VStack {
                            Text("Home")
                                .font(.custom("SF Pro Rounded", size: 56))
                                .fontWeight(.heavy)
                                .foregroundColor(Color("FontColor"))
                                .frame(width: 250, height: 140)
                            //.background()
                                .multilineTextAlignment(.center)
                                .lineLimit(2)
                                .padding(.bottom, -5.0)
                            Image(systemName: "house.fill")
                                .resizable()
                                .frame(width: 200, height: 200)
                                .foregroundColor(Color(.white))
                            
                        }.padding()
                        //Spacer(minLength: 25)
                    }
                    //.padding(.top, -10.0)
                }
            }
        }
    }
}

struct CongratsView_Previews: PreviewProvider {
    static var previews: some View {
        CongratsView()
    }
}
