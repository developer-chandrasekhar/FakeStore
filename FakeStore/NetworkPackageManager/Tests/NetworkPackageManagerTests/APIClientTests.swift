//
//  APIClientTests.swift
//  NetworkPackageManager
//
//  Created by chandra sekhar p on 11/11/24.
//

import XCTest
@testable import NetworkPackageManager

final class APIClientTests: XCTestCase {
    
    let url = "https://fakestoreapi.com"
    lazy var request = URLRequest(url: URL(string: url)!)
    var responseValidator: HttpResponseValidator!
    var urlSession: URLSession!

    override func setUpWithError() throws {
        responseValidator = HttpResponseValidator()
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockUrlProtocol.self]
        urlSession = URLSession(configuration: configuration)
    }
    
    override func tearDownWithError() throws {
        responseValidator = nil
        urlSession = nil
    }
    
    func test_httpResponseValidator_validate_success() throws {
        let sut = HttpResponseValidator()
        let response = HTTPURLResponse(url: URL(string: url)!, statusCode: 200, httpVersion: nil, headerFields: nil)!
        do {
            let result = try sut.validate(response: response)
            XCTAssertEqual(result.statusCode, 200)

        }
        catch {
            XCTFail(" should be test_httpResponseValidator_validate_success")
        }
    }
    
    func testURLSession_validResponse() async throws {

        let data = Data("Success".utf8)
        let expectation = XCTestExpectation(description: "Async operation")

        MockUrlProtocol.requestHandler = {
            let urlResponse = HTTPURLResponse(url: URL(string: self.url)!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (data, urlResponse)
        }
        do {
            let response = try await urlSession.connect(for: request, validator: responseValidator)
            XCTAssertEqual(response.0, data)
            expectation.fulfill()
        }
        catch {
            XCTFail("should return data")
        }
        await fulfillment(of: [expectation], timeout: 5.0)
    }
    
    func testURLSession_invalidHttpResponse() async throws {
        MockUrlProtocol.requestHandler = {
            let urlResponse = HTTPURLResponse(url: URL(string: self.url)!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (Data(), urlResponse)
        }
        do {
            let _ = try await urlSession.connect(for: request, validator: MockFailHttpResponseValidator())
            XCTFail("")
        }
        catch {
            XCTAssertNotNil(error, "error should not be nil.")
        }
    }
    
    func testURLSession_invalidResponse() async throws {
        MockUrlProtocol.requestHandler = {
            throw ApiError.serverNotAvailable
        }
        do {
            let _ = try await urlSession.connect(for: request, validator: responseValidator)
            XCTFail("")
        }
        catch {
            XCTAssertNotNil(error, "error should not be nil.")
        }
    }
    
    func test_httpResponseValidator_validate_fail() throws {
        let response = URLResponse(url: URL(string: url)!, mimeType: nil, expectedContentLength: 0, textEncodingName: nil)
        do {
            let _ = try responseValidator.validate(response: response)
        }
        catch {
            XCTAssertNotNil(error, "error should not be nil.")
        }
    }
}

class MockFailHttpResponseValidator: HttpResponseValidatable {
    func validate(response: URLResponse) throws -> HTTPURLResponse {
        throw ApiError.invalidResponse(url: response.url?.absoluteString)
    }
}
