//
//  ProductsRepository.swift
//  FakeStore
//
//  Created by chandra sekhar p on 11/11/24.
//

import Foundation

protocol ProductsRepository {
    func getProducts() async throws -> [Product]
    func getProductById(_ id: Int) async throws -> Product?
}
