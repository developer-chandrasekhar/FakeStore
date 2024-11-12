//
//  APICoordinatorService.swift
//  FakeStore
//
//  Created by chandra sekhar p on 11/11/24.
//

import Foundation
import NetworkPackageManager

public protocol APICoordinatorProtocol {
    func connectServerWithEndPoint<T: Codable>(endPoint: EndPoint,
                                               client: APIClient,
                                               request: ApiRequest,
                                               responseParser: GenericResponseParser) async throws -> T
}

final class APICoordinator: APICoordinatorProtocol {
    func connectServerWithEndPoint<T: Codable>(endPoint: EndPoint,
                                               client: APIClient,
                                               request: ApiRequest,
                                               responseParser: GenericResponseParser) async throws -> T {
        let apiResponse = try await client.connect(for: request.prepareRequest(endPoint: endPoint), validator: HttpResponseValidator())
        return try responseParser.parseResponse(data: apiResponse.data)
    }
}

