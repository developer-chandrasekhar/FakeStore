//
//  MockUrlProtocol.swift
//  NetworkPackageManager
//
//  Created by chandra sekhar p on 11/11/24.
//

import Foundation
@testable import NetworkPackageManager

final class MockUrlProtocol: URLProtocol {
    
    nonisolated(unsafe) static var requestHandler: (() throws -> (Data, URLResponse))?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        guard let handler = MockUrlProtocol.requestHandler else {
            fatalError("requestHandler nil")
        }
        do {
            let mockResponse = try handler()
            client?.urlProtocol(self, didReceive: mockResponse.1, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: mockResponse.0)
            client?.urlProtocolDidFinishLoading(self)
        }
        catch {
            client?.urlProtocol(self, didFailWithError: error)
        }
    }
    
    override func stopLoading() {}
}
