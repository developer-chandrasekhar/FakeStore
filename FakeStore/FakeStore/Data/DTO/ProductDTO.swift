//
//  ProductDTO.swift
//  FakeStore
//
//  Created by chandra sekhar p on 11/11/24.
//

import Foundation

public struct ProductDTO: Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String?
    let category: String?
    let image: String?
    let rating: Rating?
}

extension ProductDTO {
    struct Rating: Codable {
        let rate: Double?
        let count: Int?
    }
}

extension ProductDTO {
    func toProduct() -> Product {
        Product(id: id,
                title: title,
                price: price,
                description: description,
                category: category,
                image: image,
                rating: rating?.rate)
    }
}
