//
//  ProductWebRepository.swift
//  FakeStore
//
//  Created by chandra sekhar p on 11/11/24.
//

import Foundation

final class ProductWebRepository: ProductRepository {
    func getProducts(limit: Int) async throws -> [Product] {
        return []
    }
    
    func getProductById(_ id: Int) async throws -> Product? {
        return nil
    }
}
