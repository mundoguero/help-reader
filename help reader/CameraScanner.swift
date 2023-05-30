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
    
    var body: some View {
        NavigationView {
            CameraScannerViewController(startScanning: $startScanning, scanResult: $scanResult)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Done")
                        }
                    }
                }
                .interactiveDismissDisabled(true)
        }
        .onChange(of: scanResult) { newValue in
                    if !newValue.isEmpty {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
    }
}

struct CameraScanner_Previews: PreviewProvider {
    static var previews: some View {
        CameraScanner(startScanning: .constant(true), scanResult: .constant(""))
    }
}
