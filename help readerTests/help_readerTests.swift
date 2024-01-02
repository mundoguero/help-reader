//
//  help_readerTests.swift
//  help readerTests
//
//  Created by Jonatas Brisotti on 02/01/24.
//

import XCTest
@testable import help_reader

final class help_readerTests: XCTestCase {
    
    var viewModel: MainViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = MainViewModel()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPostDataBeginsWithContent() throws {
        // Set textToConvert to a test value
        viewModel.textToConvert = "test"
        
        // Generate postData
        let postData = viewModel.generatePostData()
        
        // Test that postData begins with "content=", it's an API requirement
        XCTAssertTrue(postData.hasPrefix("content="), "postData should start with 'content='")
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
