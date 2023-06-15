//
//  ConvertedTextViewModel.swift
//  help reader
//
//  Created by Jonatas Brisotti on 14/06/23.
//

import Foundation
import UIKit

class ConvertedTextViewModel: ObservableObject {
    func saveAsPDF(htmlContent: String, completion: @escaping (Bool) -> Void) {
        let formatter = UIMarkupTextPrintFormatter(markupText: htmlContent)
        
        let printPageRenderer = UIPrintPageRenderer()
        printPageRenderer.addPrintFormatter(formatter, startingAtPageAt: 0)
        
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, .zero, nil)
        
        for pageIndex in 0..<printPageRenderer.numberOfPages {
            UIGraphicsBeginPDFPage()
            printPageRenderer.drawPage(at: pageIndex, in: UIGraphicsGetPDFContextBounds())
        }
        
        UIGraphicsEndPDFContext()
        
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let pdfPath = "\(documentsPath)/convertedText.pdf"
        let success = pdfData.write(toFile: pdfPath, atomically: true)
        
        completion(success)
    }
}

