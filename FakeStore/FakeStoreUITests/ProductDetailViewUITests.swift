//
//  ProductDetailViewUITests.swift
//  FakeStoreUITests
//
//  Created by chandra sekhar p on 13/11/24.
//

import XCTest

final class ProductDetailViewUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launchArguments.append("UITesting")
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
        app = nil
    }
}

extension ProductDetailViewUITests {
    @MainActor
    func test_product_detail_navigation() async {
        app.launch()
         app.scrollViews.children(matching: .other).firstMatch.tap()
        let backButton = app.navigationBars.buttons.element(boundBy: 0)
        XCTAssertTrue(backButton.exists, "Back button should be present")
     }
    
    @MainActor
    func test_category() async {
        app.launch()
        app.scrollViews.children(matching: .other).firstMatch.tap()
        let textElement = app.staticTexts["category"]
        XCTAssertTrue(textElement.exists, "Category should be present")
    }
}
