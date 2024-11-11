//
//  ProductsListViewModel.swift
//  FakeStore
//
//  Created by chandra sekhar p on 11/11/24.
//

import Foundation

public final class ProductsListViewModel: ObservableObject {
    
    private let productsListUseCase: ProductsListUseCase
    
    init(productsListUseCase: ProductsListUseCase = FetchProductsListUseCase()) {
        self.productsListUseCase = productsListUseCase
    }
    
    func getProducts() {
        Task {
            do {
                let products = try await productsListUseCase.getProducts(limit: 3)
                print(products.count)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
