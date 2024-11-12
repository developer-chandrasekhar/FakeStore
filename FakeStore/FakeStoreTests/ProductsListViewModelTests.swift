//
//  ProductsListViewModelTests.swift
//  FakeStoreTests
//
//  Created by chandra sekhar p on 12/11/24.
//

import XCTest
@testable import FakeStore
@testable import NetworkPackageManager


final class ProductsListViewModelTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}

extension ProductsListViewModelTests {
    func test_handle_error_no_Network() {
        let viewModel = ProductsListViewModel()
        viewModel.handleErrors(error: ApiError.noNetwork)
        XCTAssertEqual(viewModel.errorMessage, LocalizedStrings.noNetwork.localized)
    }
    
    func test_handle_error() {
        let viewModel = ProductsListViewModel()
        viewModel.handleErrors(error: ApiError.serverNotAvailable)
        XCTAssertEqual(viewModel.errorMessage, LocalizedStrings.somethingWentWrong.localized)
    }
}

extension ProductsListViewModelTests {
    func test_handle_products_empty() {
        let viewModel = ProductsListViewModel()
        viewModel.handleProducts(products: [])
        XCTAssertEqual(viewModel.viewState, .empty)
        XCTAssertTrue(viewModel.products.isEmpty)
    }
    
    func test_handle_products_not_empty() {
        let viewModel = ProductsListViewModel()
        viewModel.handleProducts(products: [Product.getStub()])
        XCTAssertEqual(viewModel.viewState, .data)
        XCTAssertTrue(viewModel.products.count > 0)
    }
}

extension ProductsListViewModelTests {
    func test_get_products_success() async {
        let mockUseCase = ProductsListUseCaseMock_success()
        let viewModel = ProductsListViewModel(productsListUseCase: mockUseCase)
        Task {
            await viewModel.getProducts()
            XCTAssertEqual(viewModel.products.count, 1)
        }
    }
    
    func test_get_products_fail() async {
        let mockUseCase = ProductsListUseCaseMock_fail()
        let viewModel = ProductsListViewModel(productsListUseCase: mockUseCase)
        Task {
            await viewModel.getProducts()
            XCTAssertEqual(viewModel.viewState, .error)
        }
    }
    
    func test_get_products_fail_no_network() async {
        let mockNetwork = NetworkMock_fail()
        let repository = ProductWebRepository(reachability: mockNetwork)
        let useCase = FetchProductsListUseCase(productRepository: repository)
        let viewModel = ProductsListViewModel(productsListUseCase: useCase)
        Task {
            await viewModel.getProducts()
            XCTAssertEqual(viewModel.viewState, .error)
        }
    }
}

fileprivate final class ProductsListUseCaseMock_success: ProductsListUseCase {
    func getProducts(limit: Int) async throws -> [Product] {
        return [Product.getStub()]
    }
}

fileprivate final class ProductsListUseCaseMock_fail: ProductsListUseCase {
    func getProducts(limit: Int) async throws -> [Product] {
        throw ApiError.serverNotAvailable
    }
}

final class NetworkMock_fail: Reachability {
    func isReachable() -> Bool {
        return false
    }
}

