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
        NavigationStack {
            GeometryReader { geometry in
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 17)
                            .foregroundColor(Color(red: 116 / 255, green: 224 / 255, blue: 255 / 255))
                            .shadow(radius: 2, y: 5)
                        VStack {
                            Text("GREAT!")
                                .font(.custom("SF Pro Rounded", size: geometry.size.width * 0.10))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.top)
                            Spacer()
                            LottieView(animationName: "applauso")
                                .padding(-50)
                                .aspectRatio(contentMode: .fit)
                            //.border(Color.red, width: 5)
                                .clipped()
                                .padding(-8)
                            Spacer()
                        }
                    }.frame(width: geometry.size.width * 0.96, height: geometry.size.height * 0.38)
                        .padding(.bottom, 30)
                    
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 17)
                                .foregroundColor(Color(red: 153 / 255, green: 190 / 255, blue: 221 / 255))
                                .shadow(radius: 2, y: 5)
                            VStack(spacing: 0) {
                                Text("Repeat")
                                    .font(.custom("SF Pro Rounded", size: geometry.size.width * 0.08))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("FontColor"))
                                    .padding(.top)
                                Spacer()
                                Image(systemName: "gobackward")
                                    .resizable()
                                    .frame(width: geometry.size.width * 0.33,
                                           height: geometry.size.height * 0.23)
                                    .foregroundColor(Color(.white))
                                    //.border(Color.red, width: 5)
                                Spacer()
                            }
                        }.padding(.leading)
                            .frame(width: geometry.size.width * 0.48,
                                   height: geometry.size.height * 0.42)
                        
                        Spacer()
                        
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 17)
                                    .foregroundColor(Color(red: 153 / 255, green: 190 / 255, blue: 221 / 255))
                                    .shadow(radius: 2, y: 5)
                                VStack(spacing: 0) {
                                    Text("Home")
                                        .font(.custom("SF Pro Rounded", size: geometry.size.width * 0.08))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("FontColor"))
                                        .padding(.top)
                                    Spacer()
                                    Image(systemName: "house.fill")
                                        .resizable()
                                        .frame(width: geometry.size.width * 0.33,
                                               height: geometry.size.height * 0.23)
                                        .foregroundColor(Color(.white))
                                        //.border(Color.red, width: 5)
                                    Spacer()
                                }
                            }.padding(.trailing)
                                .frame(width: geometry.size.width * 0.48,
                                       height: geometry.size.height * 0.42)
                            
                        }
                    }
                    
                    
                    //.padding([.top, .leading, .trailing], geometry.size.width * 0.1) // Relative padding
                    //.padding(.bottom, geometry.size.height * 0.1) // Relative padding
                }
            }
            
        }.background(Color("BackgroundColor")
            .edgesIgnoringSafeArea(.all)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Done")
                    }
                }
            }
        )
    }
}

struct CongratsView_Previews: PreviewProvider {
    static var previews: some View {
        CongratsView()
    }
}
