//
//  Product.swift
//  FakeStore
//
//  Created by chandra sekhar p on 11/11/24.
//

import Foundation

struct Product: Identifiable {
    
    let id: Int
    let title: String
    let price: Double
    let description: String?
    let category: String?
    let image: String?
    let rating: Double?
}

