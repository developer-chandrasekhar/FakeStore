//
//  ViewModelFactoryTests.swift
//  FakeStoreTests
//
//  Created by chandra sekhar p on 15/11/24.
//

import XCTest
@testable import FakeStore

final class ViewModelFactoryTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}

extension ViewModelFactoryTests {

    func test_viewModelFactory_getProductsListViewModel_instance_UITesting() async {
        let sut = ViewModelFactory(processInfoProvider: MockProcessInfoProvider())
        let viewModel = sut.productListViewModel()
        await viewModel.getProducts()
        XCTAssertEqual(viewModel.products.count, 1, "For UITesting view model instance have only one product")
    }
    
    func test_viewModelFactory_getProductsListViewModel_instance_UITesting_noNetwork() async {
        let sut = ViewModelFactory(processInfoProvider: MockProcessInfoProvider_NoNetwork())
        let viewModel = sut.productListViewModel()
        await viewModel.getProducts()
        XCTAssertEqual(viewModel.viewState, .error, "For UITesting no network, view model instance have error state")
    }
    
    func test_viewModelFactory_getProductDetailViewModel_instance_UITesting() async {
        let sut = ViewModelFactory(processInfoProvider: MockProcessInfoProvider())
        let viewModel = sut.productDetailViewModel(product: Product.getFakeProduct())
        XCTAssertEqual(viewModel.product.id, 1, "For UITesting view model instance have only one product with id 1")
    }
}

fileprivate final class MockProcessInfoProvider: ProcessInfoProviderProtocol {
   var arguments: [String] { ["UITesting"] }
}

fileprivate final class MockProcessInfoProvider_NoNetwork: ProcessInfoProviderProtocol {
   var arguments: [String] { ["UITesting_NoNetwork"] }
}
