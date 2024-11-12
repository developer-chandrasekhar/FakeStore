//
//  ProductEndPoint.swift
//  FakeStore
//
//  Created by chandra sekhar p on 11/11/24.
//

import Foundation
import NetworkPackageManager

public enum ProductsEndPoint: EndPoint {
    case productsList(limit: Int)
    case productById(id: Int)
}

extension ProductsEndPoint {
    public var httpMethod: HTTPMethod {
        switch self {
        case .productsList: return .get
        case .productById: return .get
        }
    }
    
    public var urlString: String {
        switch self {
        case .productsList: return APIStrings.allProducts
        case .productById(let id): return APIStrings.allProducts + "/\(id)"
        }
    }
    
    public var queryParams: [URLQueryItem]? {
        switch self {
        case .productsList(let limit):
            return [URLQueryItem(name: "limit", value: "\(limit)")]
        case .productById:
            return nil
        }
    }
}
