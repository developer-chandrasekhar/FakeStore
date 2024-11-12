//
//  ProductDTOStub.swift
//  FakeStoreTests
//
//  Created by chandra sekhar p on 12/11/24.
//

import Foundation
@testable import FakeStore

extension ProductDTO {
    static func getStub() -> ProductDTO {
        return ProductDTO(
            id: 1,
            title: "Stub Product",
            price: 19.99,
            description: "description",
            category: "category",
            image: "https://example.com/sample-product-image.jpg",
            rating: Rating(rate: 4.5, count: 250)
        )
    }
}
