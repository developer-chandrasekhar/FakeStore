//
//  ProductsListUseCase.swift
//  FakeStore
//
//  Created by chandra sekhar p on 11/11/24.
//

import Foundation

public protocol ProductsListUseCase {
    func getProducts(limit: Int) async throws -> [Product]
}

public final class FetchProductsListUseCase: ProductsListUseCase {
   
    private let productRepository: ProductRepository
    
    init(productRepository: ProductRepository = ProductWebRepository()) {
        self.productRepository = productRepository
    }
    
    public func getProducts(limit: Int) async throws -> [Product] {
        try await productRepository.getProducts(limit: limit)
    }
}
