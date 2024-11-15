//
//  ProductDetailViewModelTests.swift
//  FakeStoreTests
//
//  Created by chandra sekhar p on 13/11/24.
//

import XCTest
@testable import FakeStore
@testable import NetworkPackageManager

final class ProductDetailViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}

extension ProductDetailViewModelTests {
    func test_get_product_success() async {
        let mockUseCase = ProductDetailUseCaseMock_success()
        let viewModel = ProductDetailViewModel(productDetailUseCase: mockUseCase, product: Product.getStub())
        await viewModel.fetchDetailProduct()
        XCTAssertNotNil(viewModel.product, "Product should be not nil")
    }
    
    func test_get_product_fail() async {
        let mockUseCase = ProductDetailUseCaseMock_fail()
        let viewModel = ProductDetailViewModel(productDetailUseCase: mockUseCase, product: Product.getStub())
        await viewModel.fetchDetailProduct()
        XCTAssertEqual(viewModel.viewState, .error, "view state should be error")
    }
}

fileprivate final class ProductDetailUseCaseMock_success: ProductDetailUseCase {
    func getProduct(byId id: Int) async throws -> Product {
        return Product.getStub()
    }
}

fileprivate final class ProductDetailUseCaseMock_fail: ProductDetailUseCase {
    func getProduct(byId id: Int) async throws -> Product {
        throw ApiError.serverNotAvailable
    }
}
