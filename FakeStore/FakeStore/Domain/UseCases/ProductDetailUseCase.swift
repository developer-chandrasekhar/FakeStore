//
//  ProductDetailUseCase.swift
//  FakeStore
//
//  Created by chandra sekhar p on 12/11/24.
//

import Foundation

public protocol ProductDetailUseCase {
    func getProduct(byId id: Int) async throws -> Product
}

public final class FetchProductDetailUseCase: ProductDetailUseCase {
    
    private let productRepository: ProductRepository
    
    init(productRepository: ProductRepository = ProductWebRepository()) {
        self.productRepository = productRepository
    }
    
    public func getProduct(byId id: Int) async throws -> Product {
        try await productRepository.getProductById(id)
    }
}
