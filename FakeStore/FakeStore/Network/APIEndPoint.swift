//
//  APIEndPoint.swift
//  FakeStore
//
//  Created by chandra sekhar p on 11/11/24.
//

import Foundation

public protocol EndPoint {
    var urlString: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: [String: String] { get }
}

extension EndPoint {
    
    var headers: [String: String] {
        return defaultHeaders
    }
    
    var defaultHeaders: [String: String] {
        return [
            "Content-Type": "application/json; charset=utf-8",
            "Accept": "application/json; charset=utf-8"
        ]
    }
}
