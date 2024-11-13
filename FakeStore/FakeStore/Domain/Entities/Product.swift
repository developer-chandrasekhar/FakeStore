//
//  Product.swift
//  FakeStore
//
//  Created by chandra sekhar p on 11/11/24.
//

import Foundation

/// A model representing a product in the application.
public struct Product: Identifiable {
    
    public let id: Int
    public let title: String
    public let price: Double
    public let description: String?
    public let category: String?
    public let image: String?
    public let rating: Double?
}

/// A fake model representing a product used in UI tests and previews if needed
extension Product {
    static func getFakeProduct() -> Product {
        return Product(
            id: 1,
            title: "Stub Product",
            price: 19.99,
            description: "description",
            category: "category",
            image: "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
            rating: 4.5
        )
    }
}
