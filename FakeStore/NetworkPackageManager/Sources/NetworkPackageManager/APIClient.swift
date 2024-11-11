//
//  APIClient.swift
//  FakeStore
//
//  Created by chandra sekhar p on 10/11/24.
//

import Foundation

public typealias APIResult = (data: Data, response: HTTPURLResponse)

public protocol APIClient {
    func connect(for request: URLRequest, validator: HttpResponseValidatable) async throws -> APIResult
}

public protocol HttpResponseValidatable {
    func validate(response: URLResponse) throws -> HTTPURLResponse
}

