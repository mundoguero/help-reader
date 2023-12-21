//
//  ContentView.swift
//  help reader
//
//  Created by Jonatas Brisotti on 12/05/23.
//

import SwiftUI
import VisionKit

struct MainView: View {
    
    @StateObject private var viewModel = MainViewModel()
    
    @State private var showCameraScannerView = false
    @State private var isDeviceCapacity = false
    @State private var showDeviceNotCapacityAlert = false
    @State private var scanResults: String = ""
    @State private var showModal = false
    @State private var showCongratsView: Bool = false
    @State private var isShowingScanResultView = false
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                
                VStack {
                    Spacer(minLength: geometry.size.width * 0.08)
                    HStack {
                        Text("Hi Nicola!")
                            .font(.custom("SF Pro Rounded", size: geometry.size.width * 0.08))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                            .lineLimit(1)
                        Spacer()
                    }
                    
                    HStack {
                        Text("This will be your home where you can read many books")
                            .font(.custom("SF Pro Rounded", size: geometry.size.width * 0.045))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                        Spacer()
                    }
                    
                    HStack {
                        Button {
                            if isDeviceCapacity {
                                self.showCameraScannerView = true
                            } else {
                                self.showDeviceNotCapacityAlert = true
                            }
                        } label: {
                            ZStack(alignment: .top) {
                                
                                RoundedRectangle(cornerRadius: 17)
                                    .frame(width: geometry.size.width * 0.95, height: geometry.size.height * 0.35)
                                    .foregroundColor(Color("Yellow"))
                                    .shadow(radius: 2, y: 5)
                                
                                VStack {
                                    
                                    Text("Acquire")
                                        .font(.custom("SF Pro Rounded", size: geometry.size.width * 0.06))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("FontColor"))
                                    
                                    Spacer()
                                    LottieView(animationName: "acquire")
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: geometry.size.width * 0.90, height: geometry.size.height * 0.20)
                                        .cornerRadius(17)
                                        .padding(.top)
                                    Spacer()
                                }
                            }
                        }
                        Spacer()
                    }
                    
                    HStack(spacing: geometry.size.width * 0.05) { // Relative spacing
                        Button {
                            showCongratsView.toggle()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 17)
                                    .foregroundColor(Color("Blue"))
                                    .shadow(radius: 2, y: 5)
                                
                                VStack {
                                    Text("Personal \n Books")
                                        .font(.custom("SF Pro Rounded", size: geometry.size.width * 0.06)) // 10% of parent width
                                        .fontWeight(.heavy)
                                        .foregroundColor(Color("FontColor"))
                                        .multilineTextAlignment(.center)
                                        .lineLimit(2)
                                        .padding(.bottom, -5.0)
                                    LottieView(animationName: "personal-books")
                                        .frame(width: geometry.size.width * 0.4, height: geometry.size.height * 0.25) // 40% of parent width and 25% of parent height
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
                                        .font(.custom("SF Pro Rounded", size: geometry.size.width * 0.06)) // 10% of parent width
                                        .fontWeight(.heavy)
                                        .foregroundColor(Color("FontColor"))
                                        .multilineTextAlignment(.center)
                                        .lineLimit(2)
                                        .padding(.bottom, -5.0)
                                    LottieView(animationName: "school-material-animabile")
                                        .frame(width: geometry.size.width * 0.4, height: geometry.size.height * 0.25) // 40% of parent width and 25% of parent height
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                        .cornerRadius(17)
                                }
                            }.sheet(isPresented: $showModal) {
                                ModalView()
                            }
                        }
                    }
                    
                    .padding([.top, .leading, .trailing], geometry.size.width * 0.1) // Relative padding
                    .padding(.bottom, geometry.size.height * 0.1) // Relative padding
                }
                .sheet(isPresented: $showCameraScannerView) {
                    CameraScanner(startScanning: $showCameraScannerView, scanResult: $viewModel.textToConvert)
                }
                .alert("Scanner Unavailable", isPresented: $showDeviceNotCapacityAlert, actions: {})
                .onAppear {
                    isDeviceCapacity = (DataScannerViewController.isSupported &&
                                        DataScannerViewController.isAvailable)
                }
            }
            .background(Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

