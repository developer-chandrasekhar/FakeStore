//
//  ProductEndPoint.swift
//  FakeStore
//
//  Created by chandra sekhar p on 11/11/24.
//

import Foundation
import NetworkPackageManager

/// Enum representing different API endpoints related to products.

public enum ProductsEndPoint: EndPoint {
    case productsList(limit: Int)
    case productById(id: Int)
}

extension ProductsEndPoint {
    /// Returns the HTTP method associated with each endpoint.
    public var httpMethod: HTTPMethod {
        switch self {
        // The products list endpoint uses the GET method to fetch product data
        case .productsList: return .get
            
        // The product details endpoint uses the GET method to fetch details for a specific product
        case .productById: return .get
        }
    }
    
    /// Returns the URL string for the endpoint, which may include the product ID for specific requests.
    public var urlString: String {
        switch self {
        case .productsList: return APIStrings.allProducts
        case .productById(let id): return APIStrings.allProducts + "/\(id)"
        }
    }
    
    /// Returns the query parameters for the endpoint, if any.
    public var queryParams: [URLQueryItem]? {
        switch self {
        case .productsList(let limit):
            return [URLQueryItem(name: "limit", value: "\(limit)")]
        case .productById:
            return nil
        }
    }
}
