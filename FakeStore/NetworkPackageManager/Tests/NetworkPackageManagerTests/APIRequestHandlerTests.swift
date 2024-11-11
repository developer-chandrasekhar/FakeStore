//
//  APIRequestHandlerTests.swift
//  NetworkPackageManager
//
//  Created by chandra sekhar p on 11/11/24.
//

import XCTest
@testable import NetworkPackageManager

enum FakeEndPoint_EmptyURL: EndPoint {
    case fakeCase
    var queryParams: [URLQueryItem]? { nil }
    var urlString: String { "" }
    var httpMethod: HTTPMethod { .get }
}

enum FakeEndPoint_ValidURL: EndPoint {
    case fakeCase
    var queryParams: [URLQueryItem]? { nil }
    var urlString: String { "https://fakestoreapi.com" }
    var httpMethod: HTTPMethod { .get }
}

enum FakeEndPoint_ValidURL_QueryParams: EndPoint {
    case fakeCase
    var queryParams: [URLQueryItem]? { return [URLQueryItem(name: "id", value: "1")] }
    var urlString: String { "https://fakestoreapi.com" }
    var httpMethod: HTTPMethod { .get }
}

final class APIRequestHandlerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}

extension APIRequestHandlerTests {
    
    func test_invalid_url() throws {
        let endPoint = FakeEndPoint_EmptyURL.fakeCase
        do {
            let _ = try ApiGetRequest().prepareRequest(endPoint: endPoint)
        }
        catch {
            XCTAssertNotNil(error, "Error should not be nil")
        }
    }
    
    func test_valid_url() throws {
        let endPoint = FakeEndPoint_ValidURL.fakeCase
        do {
            let request = try ApiGetRequest().prepareRequest(endPoint: endPoint)
            XCTAssertNotNil(request, "Request should not be nil")
        }
        catch {
            XCTFail("no catch block called")
        }
    }
    
    func test_valid_url_include_query_item() throws {
        let endPoint = FakeEndPoint_ValidURL_QueryParams.fakeCase
        do {
            let request = try ApiGetRequest().prepareRequest(endPoint: endPoint)
            XCTAssertEqual(request.url?.absoluteString, "https://fakestoreapi.com?id=1")
        }
        catch {
            XCTFail("no catch block called")
        }
    }
}

extension APIRequestHandlerTests {
    func test_post_invalid_url() throws {
        let endPoint = FakeEndPoint_EmptyURL.fakeCase
        do {
            let _ = try ApiPostRequest(payload: ["userName": "Chandra sekhar"]).prepareRequest(endPoint: endPoint)
        }
        catch {
            XCTAssertNotNil(error, "Error should not be nil")
        }
    }
    
    func test_post_valid_url() throws {
        let endPoint = FakeEndPoint_ValidURL_QueryParams.fakeCase
        do {
            let _ = try ApiPostRequest(payload: ["userName": "Chandra sekhar"]).prepareRequest(endPoint: endPoint)
        }
        catch {
            XCTAssertNotNil(error, "Error should not be nil")
        }
    }
}
