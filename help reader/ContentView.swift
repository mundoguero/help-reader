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
    @State private var showCongratsView: Bool = false
    @State private var isShowingScanResultView = false
    
    var body: some View {
        
        NavigationStack {
            //Empty VStack, just to prevent to open the camera inside the iPad split view
            VStack {
                
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("Hi Nicola!")
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
                        
                        Button {
                            showCongratsView.toggle()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 17)
                                    .foregroundColor(Color("Blue"))
                                    .shadow(radius: 2, y: 5)
                                
                                VStack {
                                    Text("Personal Books")
                                        .font(.custom("SF Pro Rounded", size: 56))
                                        .fontWeight(.heavy)
                                        .foregroundColor(Color("FontColor"))
                                        .frame(width: 250, height: 140)
                                        .multilineTextAlignment(.center)
                                        .lineLimit(2)
                                        .padding(.bottom, -5.0)
                                    LottieView(animationName: "personal-books")
                                        .frame(width: 260, height: 268)
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                        .cornerRadius(17)
                                }
                            }
                        }
                        .navigationDestination(isPresented: $showCongratsView) {
                            CongratsView()
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
                                        .multilineTextAlignment(.center)
                                        .lineLimit(2)
                                        .padding(.bottom, -5.0)
                                    LottieView(animationName: "school-material-animabile")
                                        .frame(width: 260, height: 268)
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                        .cornerRadius(17)
                                    
                                }
                            }.sheet(isPresented: $showModal) {
                                ModalView()
                            }
                        }
                    }
                }
                .padding([.top, .leading, .trailing], 50.0)
                .padding(.bottom, 70.0)
                
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
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
