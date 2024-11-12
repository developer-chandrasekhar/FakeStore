//
//  ProductsListViewModel.swift
//  FakeStore
//
//  Created by chandra sekhar p on 11/11/24.
//

import Foundation

public final class ProductsListViewModel: ObservableObject {
    
    @Published private(set) var viewState: ViewState = .loading
    @Published private(set) var products: [Product] = []
    private let productsListUseCase: ProductsListUseCase
    
    init(productsListUseCase: ProductsListUseCase = FetchProductsListUseCase()) {
        self.productsListUseCase = productsListUseCase
    }
    
    @MainActor
    func getProducts() {
        viewState = .loading
        Task {
            do {
                let products = try await productsListUseCase.getProducts(limit: 20)
                self.viewState = .data
                self.products = products
                print(products.count)
            } catch {
                print(error.localizedDescription)
                viewState = .error
            }
        }
    }
}
