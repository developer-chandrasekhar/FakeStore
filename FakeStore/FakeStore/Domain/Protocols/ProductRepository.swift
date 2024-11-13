//
//  ProductRepository.swift
//  FakeStore
//
//  Created by chandra sekhar p on 11/11/24.
//

import Foundation

/// A protocol that defines the contract for fetching product data.
public protocol ProductRepository {
    func getProducts(limit: Int) async throws -> [Product]
    func getProductById(_ id: Int) async throws -> Product
}
