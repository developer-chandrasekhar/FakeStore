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
        do {
            let data: [ProductDTO] = try await productRepository.getProducts(limit: limit)
            let products: [Product] = data.map {
                Product(id: $0.id,
                        title: $0.title,
                        price: $0.price,
                        description: $0.description,
                        category: $0.category,
                        image: $0.image,
                        rating: $0.rating?.rate)
            }
            return products
        } catch {
            throw error
        }
    }
}
