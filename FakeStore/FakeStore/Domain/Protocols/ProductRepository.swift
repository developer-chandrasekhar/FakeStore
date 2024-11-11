//
//  ProductRepository.swift
//  FakeStore
//
//  Created by chandra sekhar p on 11/11/24.
//

import Foundation

public protocol ProductRepository {
    func getProducts(limit: Int) async throws -> [ProductDTO]
    func getProductById(_ id: Int) async throws -> ProductDTO?
}
