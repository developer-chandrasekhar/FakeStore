//
//  ProductDetailUseCaseTests.swift
//  FakeStoreTests
//
//  Created by chandra sekhar p on 12/11/24.
//

import XCTest
@testable import FakeStore
@testable import NetworkPackageManager

final class ProductDetailUseCaseTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}

extension ProductDetailUseCaseTests {
    func test_getProduct_Success() async {
        let mockRepository = ProductRepositoryMock_success()
        let useCase = FetchProductDetailUseCase(productRepository: mockRepository)
        Task {
            do {
                let data = try await useCase.getProduct(byId: 1)
                XCTAssertNotNil(data, "Products should not be nil.")
            } catch {
                XCTFail("Should not throw error")
            }
        }
    }
    
    func test_getProducts_Fail() async {
        let mockRepository = ProductRepositoryMock_fail()
        let useCase = FetchProductDetailUseCase(productRepository: mockRepository)
        Task {
            do {
                let _ = try await useCase.getProduct(byId: 1)
            } catch {
                XCTAssertTrue(((error as? ApiError) != nil), "Should throw ApiError")
            }
        }
    }
}
