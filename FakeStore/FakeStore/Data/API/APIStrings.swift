//
//  APIStrings.swift
//  FakeStore
//
//  Created by chandra sekhar p on 11/11/24.
//

import Foundation

struct APIStrings {
    static var baseURL: String {
        //TODO: Update url based on environments
        "https://fakestoreapi.com"
    }
}

//MARK: URL PATHS FOR PRODUCTS
extension APIStrings {
    static var allProducts = APIStrings.baseURL + "/products"
    static var getProductById = APIStrings.baseURL + "/products"
}
