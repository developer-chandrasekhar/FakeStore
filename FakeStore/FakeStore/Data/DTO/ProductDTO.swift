//
//  ProductDTO.swift
//  FakeStore
//
//  Created by chandra sekhar p on 11/11/24.
//

import Foundation

struct ProductDTO: Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String?
    let category: String?
    let image: String?
    let rating: Double?
}

extension ProductDTO {
    struct Rating: Codable {
        let rate: Double?
        let count: Int?
    }
}
