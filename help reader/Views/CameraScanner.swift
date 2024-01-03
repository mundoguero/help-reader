//
//  CameraScanner.swift
//  help reader
//
//  Created by Jonatas Brisotti on 29/05/23.
//

import SwiftUI

struct CameraScanner: View {
    @Binding var startScanning: Bool
    @Binding var scanResult: String
    @Environment(\.presentationMode) var presentationMode
    @State private var navigateToScanResult = false
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                if navigateToScanResult {
                    ScanResultView(scanResult: $scanResult)
                } else {
                    CameraScannerViewController(startScanning: $startScanning, scanResult: $scanResult)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text(LocalizedStringKey("Done"))
                    }
                }
            }
            .interactiveDismissDisabled(false)
        }
        .onChange(of: scanResult) { newValue in
            if !newValue.isEmpty {
                //viewModel.makePOSTRequest()
                navigateToScanResult = true
                //self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct CameraScanner_Previews: PreviewProvider {
    static var previews: some View {
        CameraScanner(startScanning: .constant(true), scanResult: .constant(""))
    }
}
