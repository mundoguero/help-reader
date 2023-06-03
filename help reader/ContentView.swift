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
    
    var body: some View {
        
        VStack {
            
            VStack {
                        // Header
                HStack {
                    VStack(alignment: .leading) {
                        
                                Text("Hi Nicola!")
                                    .font(.largeTitle)
                                    .foregroundColor(.black)
                                Text("This will be your home where you can read many books")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                    .padding(.horizontal, 60.0)
                    Spacer()
                }
                
                        // Square with rounded corners
                
                Button {
                    if isDeviceCapacity {
                        self.showCameraScannerView = true
                    } else {
                        self.showDeviceNotCapacityAlert = true
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 17)
                            .frame(width: 640, height: 370)
                            .foregroundColor(Color("Yellow"))
                        VStack {
                            Text("Acquire")
                                .font(.system(size: 38, weight: .bold))
                                .foregroundColor(Color("FontColor"))
                            Image("lion-acquire")
                                .resizable()
                                .frame(width: 595, height: 294)
                                .aspectRatio(contentMode: .fit)
                            .cornerRadius(17)
                        }
                                
                        
                    }
                }
                        
                        // Two smaller squares side by side
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 17)
                                    .foregroundColor(Color("Blue"))
                                    .frame(width: 300, height: 390)
                                .padding()
                                
                                VStack {
                                    Text("Photo \n Gallery")
                                        .font(.system(size: 38, weight: .bold))
                                        .foregroundColor(Color("FontColor"))
                                        .multilineTextAlignment(.center)
                                        .lineLimit(2)
                                    Image("lion-photo-gallery")
                                        .resizable()
                                        .padding(.bottom)
                                        .frame(width: 260, height: 268, alignment: .bottom)
                                        .aspectRatio(contentMode: .fit)
                                    .cornerRadius(17)
                                }
                            }
                            ZStack {
                                RoundedRectangle(cornerRadius: 17)
                                    .foregroundColor(Color("Green"))
                                    .frame(width: 300, height: 390)
                                
                                VStack {
                                    Text("School \n Material")
                                        .font(.system(size: 38, weight: .bold))
                                        .foregroundColor(Color("FontColor"))
                                        .multilineTextAlignment(.center)
                                        .lineLimit(2)
                                    Image("lion-school-material")
                                        .resizable()
                                        .padding(.bottom)
                                        .frame(width: 260, height: 268, alignment: .bottom)
                                        .aspectRatio(contentMode: .fit)
                                    .cornerRadius(17)
                                }
                            }
                        }
                        .padding()
                    }
            
//            TextEditor(text: $viewModel.textToConvert)
//                .frame(width: 350, height: 200)
//                .padding()
//                .background(Color.gray.opacity(0.3).cornerRadius(12))
//                .font(.headline)
            
            HStack {
                
                Button(action: {
                    if viewModel.textValidation() {
                        viewModel.makePOSTRequest()
                    }
                    viewModel.textToConvert = ""
                }, label: {
                    Text("Convert")
                        .padding()
                        .background(viewModel.textValidation() ? Color.blue : Color.gray)
                        .cornerRadius(12)
                        .foregroundColor(.white)
                        .font(.headline)
                })
                .disabled(!viewModel.textValidation())
            }
            
            VStack {
                Text(scanResults)
                    .padding()

//                Button {
//                    if isDeviceCapacity {
//                        self.showCameraScannerView = true
//                    } else {
//                        self.showDeviceNotCapacityAlert = true
//                    }
//                } label: {
//                    Text("Tap to Scan Documents")
//                        .foregroundColor(.white)
//                        .frame(width: 300, height: 50)
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                }
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
        
        Text("\(viewModel.textToConvert)")
        Text(scanResults)
            .padding()
        HTMLView(text: $viewModel.webContent)
        
        //Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
