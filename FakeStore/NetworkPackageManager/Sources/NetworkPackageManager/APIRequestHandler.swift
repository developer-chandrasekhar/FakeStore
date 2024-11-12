//
//  APIRequestHandler.swift
//  FakeStore
//
//  Created by chandra sekhar p on 11/11/24.
//

import Foundation

public typealias URLRequestPayload = [String: Encodable]

public protocol ApiRequest {
    func prepareRequest<T: EndPoint>(endPoint: T) throws -> URLRequest
}

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
