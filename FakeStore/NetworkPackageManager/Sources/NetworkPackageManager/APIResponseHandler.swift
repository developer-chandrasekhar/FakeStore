//
//  APIResponseHandler.swift
//  FakeStore
//
//  Created by chandra sekhar p on 11/11/24.
//

import Foundation

/// Protocol defining the contract for parsing data into Codable types.
public protocol ResponseParser {
    func parseResponse<T: Codable>(data: Data) throws -> T
}

/// Parses the provided data into a model of type `T` using `JSONDecoder`.
/// If error occurs while parsing, provides complete log for the failure
public final class GenericResponseParser: ResponseParser {
    
    public init() {}
    
    public func parseResponse<T: Codable>(data: Data) throws -> T {
        do {
            let models = try JSONDecoder().decode(T.self, from: data)
            return models
        }
        catch let error as DecodingError {
            var parseErrorMessage = "Unknown error while parsing"
            var decodingContext: DecodingError.Context?
            switch error {
            case .dataCorrupted(let context):
                parseErrorMessage = "JSON parse error (dataCorrupted): data corrupted in \(context.debugDescription)"
                decodingContext = context
            case .keyNotFound(let key, let context):
                parseErrorMessage = "JSON parse error (keyNotFound): \(key) not found in \(context.debugDescription)"
                decodingContext = context
            case .typeMismatch(let type, let context):
                parseErrorMessage = "JSON parse error (typeMismatch): \(type) in \(context.debugDescription)"
                decodingContext = context
            case .valueNotFound(let type, let context):
                parseErrorMessage = "JSON parse error (valueNotFound): \(type) in \(context.debugDescription)"
                decodingContext = context
            default: break
            }
            print("Coding path: \(String(describing: decodingContext?.codingPath))")
            throw ApiError.unableToDecode
        } catch {
            throw ApiError.unableToDecode
        }
    }
}

