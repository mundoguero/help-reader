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
            GeometryReader { geometry in
                VStack {
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text("Hi Nicola!")
                                .font(.custom("SF Pro Rounded", size: geometry.size.width * 0.08)) // Adjusted font size
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            Text("This will be your home where you\ncan read many books")
                                .font(.custom("SF Pro Rounded", size: geometry.size.width * 0.045)) // Adjusted font size
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                .lineLimit(2)
                        }
                        
                        Button {
                            if isDeviceCapacity {
                                self.showCameraScannerView = true
                            } else {
                                self.showDeviceNotCapacityAlert = true
                            }
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 17)
                                    .frame(height: geometry.size.height * 0.5) // 80% of parent height
                                    .foregroundColor(Color("Yellow"))
                                    .shadow(radius: 2, y: 5)
                                    .padding()
                                VStack {
                                    Text("Acquire")
                                        .font(.custom("SF Pro Rounded", size: geometry.size.width * 0.09)) // 9% of parent width
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("FontColor"))
                                        .padding()
                                    LottieView(animationName: "acquire")
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.4) // 90% of parent width and 40% of parent height
                                        .clipped()
                                        .cornerRadius(17)
                                }
                            }
                        }.padding(.horizontal, 0)
                        
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
        ContentView()
    }
}

