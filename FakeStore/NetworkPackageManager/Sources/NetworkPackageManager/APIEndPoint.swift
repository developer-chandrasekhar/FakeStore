//
//  APIEndPoint.swift
//  FakeStore
//
//  Created by chandra sekhar p on 11/11/24.
//

import Foundation

/// ### `EndPoint` Protocol
/// The full URL string for the endpoint.
/// The HTTP method for the request (e.g., GET, POST, PUT, DELETE).
/// The headers to be included in the request.
/// The query parameters to be appended to the URL, if any.
public protocol EndPoint {
    var urlString: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: [String: String] { get }
    var queryParams: [URLQueryItem]? { get }
}


/// Returns the default headers with common content types and accept types.
/// If you have mode headers, you can confirm header variable and append default headers
extension EndPoint {
    
    public var headers: [String: String] {
        return defaultHeaders
    }

    var defaultHeaders: [String: String] {
        return [
            "Content-Type": "application/json; charset=utf-8",
            "Accept": "application/json; charset=utf-8"
        ]
    }
}
