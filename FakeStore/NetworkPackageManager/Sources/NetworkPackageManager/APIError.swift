//
//  APIError.swift
//  FakeStore
//
//  Created by chandra sekhar p on 10/11/24.
//

import Foundation

/// Provides API Errors 
public enum ApiError: Error {
    case badUrl
    case noNetwork
    case encodingError
    case invalidResponse
    case unableToDecode
    case unknownError
    case serverNotAvailable
}

