//
//  ProductsListUseCase.swift
//  FakeStore
//
//  Created by chandra sekhar p on 11/11/24.
//

import Foundation

/// A protocol defining the contract for a use case that fetches list of products.
public protocol ProductsListUseCase {
    func getProducts(limit: Int) async throws -> [Product]
}

/// A concrete implementation of the `ProductListUseCase` protocol.
/// The repository is injected via dependency injection, and the use case fetches
/// the products from the repository.
public final class FetchProductsListUseCase: ProductsListUseCase {
   
    private let productRepository: ProductRepository
    
    init(productRepository: ProductRepository = ProductWebRepository()) {
        self.productRepository = productRepository
    }
    
    public func getProducts(limit: Int) async throws -> [Product] {
        try await productRepository.getProducts(limit: limit)
    }
}
