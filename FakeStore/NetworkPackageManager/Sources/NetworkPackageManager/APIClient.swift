//
//  APIClient.swift
//  FakeStore
//
//  Created by chandra sekhar p on 10/11/24.
//

import Foundation

/// A type alias representing the result of an API call:
public typealias APIResult = (data: Data, response: HTTPURLResponse)
/// - `data`: The data returned from the API.
/// - `response`: The `HTTPURLResponse` object containing status code and other response information.

/// The `APIClient` protocol defines the structure for any client that performs HTTP requests.
public protocol APIClient {
    func connect(for request: URLRequest, validator: HttpResponseValidatable) async throws -> APIResult
}

/// The `HttpResponseValidatable` protocol abstract layer to validate response is `URLResponse` or not
public protocol HttpResponseValidatable {
    func validate(response: URLResponse) throws -> HTTPURLResponse
}

