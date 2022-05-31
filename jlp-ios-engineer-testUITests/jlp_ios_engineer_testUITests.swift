//
//  jlp_ios_engineer_testUITests.swift
//  jlp-ios-engineer-testUITests
//
//  Created by Chris Thomas on 11/05/2022.
//

import XCTest

//@testable import jlp_ios_engineer_test

class jlp_ios_engineer_testUITests: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
    }
    
    func testExample() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        // Check activity indicator during json loading
        let spinner = app.activityIndicators.firstMatch
        XCTAssertTrue(spinner.exists)
        sleep(10)
        
        // Check collection view and cell components
        let collectionView = app.collectionViews.element
        XCTAssertTrue(collectionView.exists)
        
        let cell = collectionView.children(matching: .cell).element(boundBy: 0)
        XCTAssertTrue(cell.exists)
        let cellImage = cell.images.element
        XCTAssertTrue(cellImage.exists)
        
        cell.tap()
        
        // Check prouct detail page image and tableview
        let productImage = app.images.element
        XCTAssertTrue(productImage.exists)
        let productTable = app.tables.element
        XCTAssertTrue(productTable.exists)
        
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
