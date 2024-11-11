//
//  ProductWebRepository.swift
//  FakeStore
//
//  Created by chandra sekhar p on 11/11/24.
//

import Foundation

final class ProductWebRepository: ProductRepository, APICoordinatorService {
    
    func getProducts(limit: Int) async throws -> [ProductDTO] {
        let data: [ProductDTO] = try await connectServerWithEndPoint(endPoint: ProductsEndPoint.productsList(limit: limit))
        return data
    }
    
    func getProductById(_ id: Int) async throws -> ProductDTO? {
        return nil
    }
}
