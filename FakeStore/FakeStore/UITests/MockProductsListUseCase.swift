//
//  MockProductsListUseCase.swift
//  FakeStore
//
//  Created by chandra sekhar p on 13/11/24.
//

import Foundation
import NetworkPackageManager
final class MockProductsListUseCase: ProductsListUseCase {
    func getProducts(limit: Int) async throws -> [Product] {
        return [Product.getFakeProduct()]
    }
}

final class MockProductsListUseCase_NoNetwork: ProductsListUseCase {
    func getProducts(limit: Int) async throws -> [Product] {
        throw ApiError.noNetwork
    }
}
