//
//  ProductRepositoryMock.swift
//  FakeStoreTests
//
//  Created by chandra sekhar p on 12/11/24.
//

import Foundation
@testable import FakeStore
@testable import NetworkPackageManager

final class ProductRepositoryMock_success: ProductRepository {
    func getProducts(limit: Int) async throws -> [Product] {
        return [Product.getStub()]
    }
    
    func getProductById(_ id: Int) async throws -> Product {
        return Product.getStub()
    }
}

final class ProductRepositoryMock_fail: ProductRepository {
    func getProducts(limit: Int) async throws -> [Product] {
        throw ApiError.serverNotAvailable
    }
    
    func getProductById(_ id: Int) async throws -> Product {
        throw ApiError.serverNotAvailable
    }
}
