//
//  APICoordinatorService.swift
//  FakeStore
//
//  Created by chandra sekhar p on 11/11/24.
//

import Foundation
import NetworkPackageManager

/// A protocol that defines the methods for coordinating API requests and responses.
public protocol APICoordinatorProtocol {
    /// Connects to the server with a specific endpoint and request, and parses the response into the specified type.
    func connectServerWithEndPoint<T: Codable>(endPoint: EndPoint,
                                               client: APIClient,
                                               request: ApiRequest,
                                               responseParser: GenericResponseParser) async throws -> T
}

/// A concrete implementation of the `APICoordinatorProtocol` that handles sending API requests and parsing responses.
final class APICoordinator: APICoordinatorProtocol {
    func connectServerWithEndPoint<T: Codable>(endPoint: EndPoint,
                                               client: APIClient,
                                               request: ApiRequest,
                                               responseParser: GenericResponseParser) async throws -> T {
        let apiResponse = try await client.connect(for: request.prepareRequest(endPoint: endPoint), validator: HttpResponseValidator())
        return try responseParser.parseResponse(data: apiResponse.data)
    }
}

