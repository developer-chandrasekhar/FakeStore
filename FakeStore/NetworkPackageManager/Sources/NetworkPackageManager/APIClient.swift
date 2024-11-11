//
//  APIClient.swift
//  FakeStore
//
//  Created by chandra sekhar p on 10/11/24.
//

import Foundation

public typealias APIResult = (data: Data, response: HTTPURLResponse)

public protocol APIClient {
    func connect(for request: URLRequest) async throws -> APIResult
}

