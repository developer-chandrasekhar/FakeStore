//
//  ProductsListUseCaseTests.swift
//  FakeStoreTests
//
//  Created by chandra sekhar p on 12/11/24.
//

import XCTest
@testable import FakeStore
@testable import NetworkPackageManager

final class ProductsListUseCaseTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}

extension ProductsListUseCaseTests {
    func test_getProducts_Success() async {
        let mockRepository = ProductRepositoryMock_success()
        let useCase = FetchProductsListUseCase(productRepository: mockRepository)
        Task {
            do {
                let data = try await useCase.getProducts(limit: 1)
                XCTAssertEqual(data.count, 1)
            } catch {
                XCTFail("Should not throw error")
            }
        }
    }
    
    func test_getProducts_Fail() async {
        let mockRepository = ProductRepositoryMock_fail()
        let useCase = FetchProductsListUseCase(productRepository: mockRepository)
        Task {
            do {
                let _ = try await useCase.getProducts(limit: 1)
            } catch {
                XCTAssertTrue(((error as? ApiError) != nil))
            }
        }
    }
}

