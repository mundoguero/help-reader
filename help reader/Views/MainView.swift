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
                    Spacer(minLength: geometry.size.height * 0.05)
                    
                    //Hi Nicola
                    VStack(spacing: 10) {
                        HStack {
                            Text("Hi Nicola!")
                                .font(.custom("SF Pro Rounded", size: geometry.size.width * 0.08))
                                .fontWeight(.bold)
                                .foregroundColor(Color("FontBlackWhite"))
                                .multilineTextAlignment(.leading)
                                .lineLimit(1)
                                .padding(.leading)
                            Spacer()
                        }
                        HStack {
                            Text("This will be your home where you can read many books")
                                .font(.custom("SF Pro Rounded", size: geometry.size.width * 0.04))
                                .foregroundColor(Color("FontBlackWhite"))
                                //.multilineTextAlignment(.leading)
                                //.lineLimit(3)
                                .padding(.leading)
                            Spacer()
                        }
                        
                    }
                    
                    //Acquire
                    Button {
                        if isDeviceCapacity {
                            self.showCameraScannerView = true
                        } else {
                            self.showDeviceNotCapacityAlert = true
                        }
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 17)
                                .foregroundColor(Color("Yellow"))
                                .shadow(radius: 2, y: 5)
                            VStack(spacing: 0) {
                                Text(LocalizedStringKey("Acquire"))
                                    .font(.custom("SF Pro Rounded", size: geometry.size.width * 0.08))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("FontColor"))
                                    .padding(.top)
                                Spacer()
                                LottieView(animationName: "acquire")
                                    .padding(-10)
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.25)
                                    //.border(Color.red, width: 5)
                                    .clipShape(RoundedRectangle(cornerRadius: 17, style: .continuous))
                                Spacer()
                            }
                        }.frame(width: geometry.size.width * 0.96, height: geometry.size.height * 0.38)
                    }
                    .padding(.bottom)
                    
                    
                    HStack {
                        //Spacer()
                        //Personal Books
                        Button {
                            showCongratsView.toggle()
                        } label: {
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 17)
                                    .foregroundColor(Color("Blue"))
                                    .shadow(radius: 2, y: 5)
                                VStack(spacing: 0) {
                                    Text(LocalizedStringKey("Personal Books"))
                                        .font(.custom("SF Pro Rounded", size: geometry.size.width * 0.06))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("FontColor"))
                                        .multilineTextAlignment(.center)
                                        .lineLimit(2)
                                        .padding(.top)
                                    Spacer()
                                    LottieView(animationName: "personal-books")
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: geometry.size.width * 0.35, height: geometry.size.height * 0.27)
                                        //.border(Color.red, width: 5)
                                        .clipShape(RoundedRectangle(cornerRadius: 17, style: .continuous))
                                        .padding(.bottom)
                                }
                            }.padding(.leading).frame(width: geometry.size.width * 0.44, height: geometry.size.height * 0.42)
                        }
                        .navigationDestination(isPresented: $showCongratsView) {
                            CongratsView()
                        }
                        
                        Spacer()
                        
                        //School Material
                        Button {
                            showModal = true
                        } label: {
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 17)
                                    .foregroundColor(Color("Green"))
                                    .shadow(radius: 2, y: 5)
                                VStack(spacing: 0) {
                                    Text(LocalizedStringKey("School Material"))
                                        .font(.custom("SF Pro Rounded", size: geometry.size.width * 0.06))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("FontColor"))
                                        .multilineTextAlignment(.center)
                                        .lineLimit(2)
                                        .padding(.top)
                                    Spacer()
                                    LottieView(animationName: "school-material-animabile")
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: geometry.size.width * 0.35, height: geometry.size.height * 0.27) // 40% of parent width and 25% of parent height
                                        //.border(Color.red, width: 5)
                                        .clipShape(RoundedRectangle(cornerRadius: 17, style: .continuous))
                                        .padding(.bottom)
                                }
                            }.frame(width: geometry.size.width * 0.44, height: geometry.size.height * 0.42)
                                .padding(.trailing)
                            .sheet(isPresented: $showModal) {
                                ModalView()
                                
                            }
                        }
                    }
                    
                   
                    //.padding([.top, .leading, .trailing], geometry.size.width * 0.1) // Relative padding
                    //.padding(.bottom, geometry.size.height * 0.1) // Relative padding
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

