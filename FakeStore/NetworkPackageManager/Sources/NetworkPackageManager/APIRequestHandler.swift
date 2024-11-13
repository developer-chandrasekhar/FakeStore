//
//  APIRequestHandler.swift
//  FakeStore
//
//  Created by chandra sekhar p on 11/11/24.
//

import Foundation

/// A typealias representing a payload dictionary for URL requests where the values conform to `Encodable`.
public typealias URLRequestPayload = [String: Encodable]

/// Defines an interface for preparing `URLRequest` objects from an `EndPoint`.
/// - Throws: An error if the request could not be prepared.
/// - Returns: A configured `URLRequest` instance.
public protocol ApiRequest {
    func prepareRequest<T: EndPoint>(endPoint: T) throws -> URLRequest
}

/// A class responsible for creating GET requests.
public final class ApiGetRequest: ApiRequest {
    
    public init() {}
    
    public func prepareRequest<T: EndPoint>(endPoint: T) throws -> URLRequest {
        do{
            return try self.prepareBaseRequest(endPoint: endPoint)
        } catch(let error) {
            throw error
        }
    }
}

/// A class responsible for creating POST requests with a payload.
/// Once request is prepared using base request method, appends payload to it
public final class ApiPostRequest: ApiRequest {
    
    let payload: Encodable
    
    public init(payload: Encodable) {
        self.payload = payload
    }
    
    public func prepareRequest<T: EndPoint>(endPoint: T) throws -> URLRequest {
        do{
            var request = try self.prepareBaseRequest(endPoint: endPoint)
            let encodedPayload = try JSONEncoder().encode(payload)
            request.httpBody = encodedPayload
            return request
        }
        catch {
            throw error
        }
    }
}

/// Provides a base implementation for preparing a `URLRequest`.
/// Based on the endpoint information this class can create base request.
extension ApiRequest {
    fileprivate func prepareBaseRequest<T: EndPoint>(endPoint: T) throws -> URLRequest {
        guard let escapedUrlString = endPoint.urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
              var url = URL(string: escapedUrlString) else {
            throw ApiError.badUrl
        }
        if let params = endPoint.queryParams {
            url = url.appending(queryItems: params)
        }
        var request = URLRequest(url: url)
        request.httpMethod = endPoint.httpMethod.method
        endPoint.headers.forEach { (key, value) in
            request.setValue(value, forHTTPHeaderField: key)
        }
        return request
    }
}
