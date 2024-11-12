//
//  ProductWebRepository.swift
//  FakeStore
//
//  Created by chandra sekhar p on 11/11/24.
//

import Foundation
import NetworkPackageManager

final class ProductWebRepository: ProductRepository {
    
    private let reachability: Reachability
    private let apiCoordinator: APICoordinatorService
    private let apiClient: APIClient
    
    init(reachability: Reachability = NetworkReachability.shared,
         apiCoordinator: APICoordinatorService = APICoordinator(),
         apiClient: APIClient = URLSession.shared) {
        self.reachability = reachability
        self.apiClient = apiClient
        self.apiCoordinator = apiCoordinator
    }
    
    func getProducts(limit: Int) async throws -> [ProductDTO] {
        guard reachability.isReachable() else {
            throw ApiError.noNetwork
        }
        let endpoint = ProductsEndPoint.productsList(limit: limit)
        let data: [ProductDTO] = try await apiCoordinator.connectServerWithEndPoint(endPoint: endpoint,
                                                                                    client: apiClient,
                                                                                    request: ApiGetRequest(),
                                                                                    responseParser: GenericResponseParser())
        return data
    }
    
    func getProductById(_ id: Int) async throws -> ProductDTO {
        let endpoint = ProductsEndPoint.productById(id: id)
        let data: ProductDTO = try await apiCoordinator.connectServerWithEndPoint(endPoint: endpoint,
                                                                                   client: apiClient,
                                                                                   request: ApiGetRequest(),
                                                                                   responseParser: GenericResponseParser())
        return data
    }
}
