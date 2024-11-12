//
//  ProductStub.swift
//  FakeStoreTests
//
//  Created by chandra sekhar p on 12/11/24.
//

import Foundation
@testable import FakeStore

extension Product {
    static func getStub() -> Product {
        return Product(
            id: 1,
            title: "Stub Product",
            price: 19.99,
            description: "description",
            category: "category",
            image: "https://example.com/sample-product-image.jpg",
            rating: 4.5
        )
    }
}
