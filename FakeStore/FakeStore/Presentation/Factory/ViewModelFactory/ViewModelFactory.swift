//
//  ViewModelFactory.swift
//  FakeStore
//
//  Created by chandra sekhar p on 14/11/24.
//

import Foundation

/// This is the place where we can create view models

final class ViewModelFactory {
    
    private let userInterFaceTestingKey = "UITesting"
    private let userInterFaceTesting_NoNetworkKey = "UITesting_NoNetwork"
    
    public func productListViewModel() -> ProductsListViewModel {
        // Return view model with mock useCase while UITesting no network condition
        if ProcessInfo.processInfo.arguments.contains(userInterFaceTesting_NoNetworkKey) {
            return ProductsListViewModel(productsListUseCase: MockProductsListUseCase_NoNetwork())
        }
        // Return view model with mock useCase while UITesting
        if ProcessInfo.processInfo.arguments.contains(userInterFaceTestingKey) {
            return ProductsListViewModel(productsListUseCase: MockProductsListUseCase())
        }
        // Actual view model
        return ProductsListViewModel()
    }
    
    public func productDetailViewModel(product: Product) -> ProductDetailViewModel {
        // Return view model with mock useCase while UITesting
        if ProcessInfo.processInfo.arguments.contains(userInterFaceTestingKey) {
            return ProductDetailViewModel(productDetailUseCase: MockProductDetailUseCase(), product: product)
        }
        // Actual view model
        return ProductDetailViewModel(product: product)
    }
}
