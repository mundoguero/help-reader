//
//  ContentView.swift
//  help reader
//
//  Created by Jonatas Brisotti on 12/05/23.
//

import SwiftUI
import VisionKit

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    
    @State private var showCameraScannerView = false
    @State private var isDeviceCapacity = false
    @State private var showDeviceNotCapacityAlert = false
    @State private var scanResults: String = ""
    @State private var showModal = false
    
    var body: some View {
        
        //De fora
        VStack {
            
            VStack(alignment: .leading) {
                
                
                // Header
                
                VStack(alignment: .leading) {
                    Text("Hi Nicola!")
                        //.font(.largeTitle)
                        .font(.custom("SF Pro Rounded", size: 36))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    Text("This will be your home where you\ncan read many books")
                        .font(.custom("SF Pro Rounded", size: 20))
                        .font(.title)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                }.padding(0)
                
                Spacer(minLength: 50)
                
                Button {
                    if isDeviceCapacity {
                        self.showCameraScannerView = true
                    } else {
                        self.showDeviceNotCapacityAlert = true
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 17)
                            .frame(height: 400)
                            .foregroundColor(Color("Yellow"))
                            .shadow(radius: 2, y: 5)
                            .padding(0)
                        VStack {
                            Text("Acquire")
                                .font(.custom("SF Pro Rounded", size: 56))
                                .frame(width: 200, height: 30)
                                .fontWeight(.bold)
                                .foregroundColor(Color("FontColor"))
                                .padding(.top, 5)
                            LottieView(animationName: "acquire")
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 630, height: 330)
                                .clipped()
                                .padding(-15)
                                .cornerRadius(17)
                        }
                        
                        
                    }
                }.padding(.horizontal, 0)
                Spacer(minLength: 25)
                
                // Two smaller squares side by side
                
                HStack(spacing: 30) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 17)
                            .foregroundColor(Color("Blue"))
                            .shadow(radius: 2, y: 5)
                        //.frame(width: 310, height: 390)
                        //.padding(.leading, -20.0)
                        
                        VStack {
                            Text("Photo Gallery")
                                .font(.custom("SF Pro Rounded", size: 56))
                                .fontWeight(.heavy)
                                .foregroundColor(Color("FontColor"))
                                .frame(width: 250, height: 140)
                                //.background()
                                .multilineTextAlignment(.center)
                                .lineLimit(2)
                                .padding(.bottom, -5.0)
                            LottieView(animationName: "personal-books")
                                .frame(width: 260, height: 268)
                                .aspectRatio(contentMode: .fill)
                                //.background()
                                .clipped()
                                .cornerRadius(17)
                        }
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 17)
                            .foregroundColor(Color("Green"))
                            .shadow(radius: 2, y: 5)
                        
                            
                            Button {
                                showModal = true
                            } label: {
                                VStack {
                                Text("School Material")
                                    .font(.custom("SF Pro Rounded", size: 56))
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color("FontColor"))
                                    .frame(width: 250, height: 140)
                                    //.background()
                                    .multilineTextAlignment(.center)
                                    .lineLimit(2)
                                    .padding(.bottom, -5.0)
                                LottieView(animationName: "school-material-animabile")
                                    .frame(width: 260, height: 268)
                                    .aspectRatio(contentMode: .fill)
                                    //.background()
                                    .clipped()
                                    .cornerRadius(17)
                                
                            }
                            }.sheet(isPresented: $showModal) {
                                ModalView()
                            }
                            
                            
                            
                            
                        
                        //.padding(.top, -10.0)
                    }
                }
            }
            .padding([.top, .leading, .trailing], 50.0)
            .padding(.bottom, 70.0)
            
            
            //            TextEditor(text: $viewModel.textToConvert)
            //                .frame(width: 350, height: 200)
            //                .padding()
            //                .background(Color.gray.opacity(0.3).cornerRadius(12))
            //                .font(.headline)
            
//            HStack {
//
//                Button(action: {
//                    if viewModel.textValidation() {
//                        viewModel.makePOSTRequest()
//                    }
//                    viewModel.textToConvert = ""
//                }, label: {
//                    Text("Convert")
//                        .padding()
//                        .background(viewModel.textValidation() ? Color.blue : Color.gray)
//                        .cornerRadius(12)
//                        .foregroundColor(.white)
//                        .font(.headline)
//                })
//                .disabled(!viewModel.textValidation())
//            }
            
//            VStack {
//                Text(scanResults)
//                    .padding()
//
//                                Button {
//                                    if isDeviceCapacity {
//                                        self.showCameraScannerView = true
//                                    } else {
//                                        self.showDeviceNotCapacityAlert = true
//                                    }
//                                } label: {
//                                    Text("Tap to Scan Documents")
//                                        .foregroundColor(.white)
//                                        .frame(width: 300, height: 50)
//                                        .background(Color.blue)
//                                        .cornerRadius(10)
//                                }
//            }
            
            .sheet(isPresented: $showCameraScannerView) {
                CameraScanner(startScanning: $showCameraScannerView, scanResult: $viewModel.textToConvert)
            }
            .alert("Scanner Unavailable", isPresented: $showDeviceNotCapacityAlert, actions: {})
            .onAppear {
                isDeviceCapacity = (DataScannerViewController.isSupported &&
                                    DataScannerViewController.isAvailable)
            }
        }.background(Color("BackgroundColor")
            .edgesIgnoringSafeArea(.all)
        )
        

        
        
//        Text("\(viewModel.textToConvert)")
//        Text(scanResults)
//            .padding()
//        HTMLView(text: $viewModel.webContent)
        
        //Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
