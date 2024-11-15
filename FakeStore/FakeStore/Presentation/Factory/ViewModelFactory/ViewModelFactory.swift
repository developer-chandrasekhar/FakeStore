//
//  ViewModelFactory.swift
//  FakeStore
//
//  Created by chandra sekhar p on 14/11/24.
//

import Foundation

/// Using this protocol, enabled convenience to pass custom arguments
public protocol ProcessInfoProviderProtocol {
    var arguments: [String] { get }
}

/// This class is a concrete implementation for actual process info arguments
final class ProcessInfoProvider: ProcessInfoProviderProtocol {
    var arguments = ProcessInfo.processInfo.arguments
}

/// This is the place where we can create view model instances
final class ViewModelFactory {
    
    private let userInterFaceTestingKey = "UITesting"
    private let userInterFaceTesting_NoNetworkKey = "UITesting_NoNetwork"
    private(set) var processInfoProvider: ProcessInfoProviderProtocol
    
    init(processInfoProvider: ProcessInfoProviderProtocol = ProcessInfoProvider()) {
        self.processInfoProvider = processInfoProvider
    }
    
    public func productListViewModel() -> ProductsListViewModel {
        // Return view model with mock useCase while UITesting no network condition
        if processInfoProvider.arguments.contains(userInterFaceTesting_NoNetworkKey) {
            return ProductsListViewModel(productsListUseCase: MockProductsListUseCase_NoNetwork())
        }
        // Return view model with mock useCase while UITesting
        if processInfoProvider.arguments.contains(userInterFaceTestingKey) {
            return ProductsListViewModel(productsListUseCase: MockProductsListUseCase())
        }
        // Actual view model
        return ProductsListViewModel()
    }
    
    public func productDetailViewModel(product: Product) -> ProductDetailViewModel {
        // Return view model with mock useCase while UITesting
        if processInfoProvider.arguments.contains(userInterFaceTestingKey) {
            return ProductDetailViewModel(productDetailUseCase: MockProductDetailUseCase(), product: product)
        }
        // Actual view model
        return ProductDetailViewModel(product: product)
    }
}
