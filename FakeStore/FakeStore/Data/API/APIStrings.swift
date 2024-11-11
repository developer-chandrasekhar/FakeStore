//
//  APIStrings.swift
//  FakeStore
//
//  Created by chandra sekhar p on 11/11/24.
//

import Foundation

public struct APIStrings {
   public static var baseURL: String { "https://fakestoreapi.com" }
}

extension APIStrings {
    static var allProducts = APIStrings.baseURL + "/products"
    static var getProductById = APIStrings.baseURL + "/products"
}
