//
//  APIResponseHandlerTests.swift
//  NetworkPackageManager
//
//  Created by chandra sekhar p on 11/11/24.
//

import XCTest
@testable import NetworkPackageManager

final class APIResponseHandlerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}

extension APIResponseHandlerTests {
    func test_valid_response() throws {
        let jsonString = "{\"name\": \"Chandra\"}"
        let data = Data(jsonString.utf8)
        do {
            let model: FakeModel = try GenericResponseParser().parseResponse(data: data)
            XCTAssertEqual(model.name, "Chandra")
        } catch {
            XCTFail("no catch block called")
        }
    }
    
    func test_inValid_response() throws {
        let jsonString = "{\"nameaa\": \"Chandra\"}"
        let data = Data(jsonString.utf8)
        do {
            let _ : FakeModel = try GenericResponseParser().parseResponse(data: data)
        } catch {
            XCTAssertNotNil(error, "Error should not be nil")
        }
    }
    
    func test_type_mismatch() throws {
        let jsonString = "{\"name\": 123}"
        let data = Data(jsonString.utf8)
        do {
            let _ : FakeModel = try GenericResponseParser().parseResponse(data: data)
        } catch {
            XCTAssertNotNil(error, "Error should not be nil")
        }
    }
    
    func test_type_data_corrupted() throws {
        let jsonString = "{\"name\": /123a}"
        let data = Data(jsonString.utf8)
        do {
            let _ : FakeModel = try GenericResponseParser().parseResponse(data: data)
        } catch {
            XCTAssertNotNil(error, "Error should not be nil")
        }
    }
    
    func test_type_value_notFound() throws {
        let jsonString = "{ \"age\": 30 }"
        let data = Data(jsonString.utf8)
        do {
            let _ : FakeModel = try GenericResponseParser().parseResponse(data: data)
        } catch {
            XCTAssertNotNil(error, "Error should not be nil")
        }
    }
}

struct FakeModel: Codable {
    let name: String
    let age: Int?
}
