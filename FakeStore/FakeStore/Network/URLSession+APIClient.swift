//
//  URLSession+APIClient.swift
//  FakeStore
//
//  Created by chandra sekhar p on 10/11/24.
//

import Foundation

extension URLSession: APIClient {
   public func connect(for request: URLRequest) async throws -> APIResult {
        do {
            let result: (data: Data, response: URLResponse) = try await self.data(for: request)
            guard let httpResponse = result.response as? HTTPURLResponse else {
                throw ApiError.invalidResponse(response: result.response.url?.absoluteString ?? "")
            }
            return (result.data, httpResponse)
        } catch {
            print(error)
            throw ApiError.invalidResponse(response: request.url?.absoluteString ?? "")
        }
    }
}
