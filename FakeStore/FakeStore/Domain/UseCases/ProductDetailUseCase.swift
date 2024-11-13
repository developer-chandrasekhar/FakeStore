//
//  ProductDetailUseCase.swift
//  FakeStore
//
//  Created by chandra sekhar p on 12/11/24.
//

import Foundation

/// A protocol defining the contract for a use case that fetches product details.
public protocol ProductDetailUseCase {
    func getProduct(byId id: Int) async throws -> Product
}

/// A concrete implementation of the `ProductDetailUseCase` protocol.
/// The repository is injected via dependency injection, and the use case fetches
/// the product details from the repository.

public final class FetchProductDetailUseCase: ProductDetailUseCase {
    
    private let productRepository: ProductRepository
    
    init(productRepository: ProductRepository = ProductWebRepository()) {
        self.productRepository = productRepository
    }
    
    public func getProduct(byId id: Int) async throws -> Product {
        try await productRepository.getProductById(id)
    }
}
