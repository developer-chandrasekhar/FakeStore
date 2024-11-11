//
//  APIError.swift
//  FakeStore
//
//  Created by chandra sekhar p on 10/11/24.
//

import Foundation

enum ApiError: Error {
    case badUrl(url: String)
    case noNetwork
    case encodingError
    case invalidResponse(url: String?)
    case unableToDecode(reason: String)
    case unknownError(reason: String)
    case serverNotAvailable
}

