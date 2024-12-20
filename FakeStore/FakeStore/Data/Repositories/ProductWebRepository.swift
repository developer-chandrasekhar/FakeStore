//
//  ProductWebRepository.swift
//  FakeStore
//
//  Created by chandra sekhar p on 11/11/24.
//

import Foundation
import NetworkPackageManager

/// A concrete implementation of `ProductRepository` for fetching product data from a web service.
/// `ProductWebRepository` is responsible for interacting with the API to retrieve product data. It uses the `APICoordinator`

final class ProductWebRepository: ProductRepository {
    
    private let reachability: Reachability
    private let apiCoordinator: APICoordinatorProtocol
    private let apiClient: APIClient
    
    init(reachability: Reachability = NetworkReachability.shared,
         apiCoordinator: APICoordinatorProtocol = APICoordinator(),
         apiClient: APIClient = URLSession.shared) {
        self.reachability = reachability
        self.apiClient = apiClient
        self.apiCoordinator = apiCoordinator
    }
    
    func getProducts(limit: Int) async throws -> [Product] {
        guard reachability.isReachable() else {
            throw ApiError.noNetwork
        }
        let endpoint = ProductsEndPoint.productsList(limit: limit)
        let data: [ProductDTO] = try await apiCoordinator.connectServerWithEndPoint(endPoint: endpoint,
                                                                                    client: apiClient,
                                                                                    request: ApiGetRequest(),
                                                                                    responseParser: GenericResponseParser())
        return data.map({ $0.toProduct() })
    }
    
    func getProductById(_ id: Int) async throws -> Product {
        let endpoint = ProductsEndPoint.productById(id: id)
        let data: ProductDTO = try await apiCoordinator.connectServerWithEndPoint(endPoint: endpoint,
                                                                                   client: apiClient,
                                                                                   request: ApiGetRequest(),
                                                                                   responseParser: GenericResponseParser())
        return data.toProduct()
    }
}
