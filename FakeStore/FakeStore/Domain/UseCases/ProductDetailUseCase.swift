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
        do {
            let data: ProductDTO = try await productRepository.getProductById(id)
            return Product(id: data.id,
                    title: data.title,
                    price: data.price,
                    description: data.description,
                    category: data.category,
                    image: data.image,
                    rating: data.rating?.rate)
        } catch {
            throw error
        }
    }
}
