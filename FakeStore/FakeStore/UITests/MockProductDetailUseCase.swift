//
//  MockProductDetailUseCase.swift
//  FakeStore
//
//  Created by chandra sekhar p on 13/11/24.
//

import Foundation

final class MockProductDetailUseCase: ProductDetailUseCase {
    func getProduct(byId id: Int) async throws -> Product {
        return Product.getFakeProduct()
    }
}
