//
//  ProductWebRepositoryTests.swift
//  FakeStoreTests
//
//  Created by chandra sekhar p on 13/11/24.
//

import XCTest
@testable import FakeStore
@testable import NetworkPackageManager

final class ProductWebRepositoryTests: XCTestCase {
    
    let singleProductJson = """
        {
            "id": 1,
            "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
            "price": 109.95,
            "description": "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
            "category": "men's clothing",
            "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
            "rating": {
                "rate": 3.9,
                "count": 120
            }
        }
        """
    let multiProductJson = """
        [{
            "id": 1,
            "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
            "price": 109.95,
            "description": "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
            "category": "men's clothing",
            "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
            "rating": {
                "rate": 3.9,
                "count": 120
            }
        }]
        """

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}

extension ProductWebRepositoryTests {
    func test_fetchProduct_success() async throws {
        let apiClient = MockApiClient(jsonString: singleProductJson)
        let repository = ProductWebRepository(apiClient: apiClient)
        let product = try await repository.getProductById(1)
        XCTAssertEqual(product.id, 1, "Product id is not equal to 1")
    }
    
    func test_fetchProducts_success() async throws {
        let apiClient = MockApiClient(jsonString: multiProductJson)
        let repository = ProductWebRepository(apiClient: apiClient)
        let products = try await repository.getProducts(limit: 1)
        XCTAssertEqual(products.count, 1, "Products count is not equal to 1")
    }
}

fileprivate final class MockApiClient: APIClient {
    private var jsonString: String
    init(jsonString: String) {
        self.jsonString = jsonString
    }
    func connect(for request: URLRequest, validator: HttpResponseValidatable) async throws -> APIResult {

        let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
        return (Data(jsonString.utf8), response)
    }
}

enum FakeEndPoint: EndPoint {
    case fakeCase
    var queryParams: [URLQueryItem]? { nil }
    var urlString: String { "https://fakestoreapi.com/products" }
    var httpMethod: HTTPMethod { .get }
}
