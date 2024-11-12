//
//  URLSession+APIClient.swift
//  FakeStore
//
//  Created by chandra sekhar p on 10/11/24.
//

import Foundation


extension URLSession: APIClient {
   public func connect(for request: URLRequest, validator: HttpResponseValidatable) async throws -> APIResult {
       do {
           let response: (Data, URLResponse) = try await self.data(for: request)
           do {
               let httpResponse = try validator.validate(response: response.1)
               return (response.0, httpResponse)
           } catch {
               throw error
           }
       } catch {
           if error as? ApiError != nil { throw error }
           else {
               throw ApiError.invalidResponse
           }
       }
    }
}

public final class HttpResponseValidator: HttpResponseValidatable {
    public init() {}
    public func validate(response: URLResponse) throws -> HTTPURLResponse {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw ApiError.invalidResponse
        }
        return httpResponse
    }
}
