//
//  ProductsListViewUITests.swift
//  FakeStoreUITests
//
//  Created by chandra sekhar p on 13/11/24.
//

import XCTest
@testable import FakeStore

final class ProductsListViewTests: XCTestCase {
    
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

extension ProductsListViewTests {
    @MainActor
    func test_no_network() async throws {
        app.launchArguments.append("UITesting_NoNetwork")
        app.launch()
        let textElement = app.staticTexts["Seems to be you are offline, Check your internet connectivity."]
        XCTAssertTrue(textElement.exists, "Wrong internet connectivity message")
     }
    
    @MainActor
    func test_navigation_title() async throws {
        app.launch()
        let navigationBar = app.navigationBars["Products List"]
        XCTAssertTrue(navigationBar.exists, "Navigation title should not nil.")
    }
    
    @MainActor
    func test_products_count() async throws {
        app.launch()
        let products = app.scrollViews.children(matching: .other)
        XCTAssertEqual(products.count, 1, "Products count should be 1.")
    }
}
