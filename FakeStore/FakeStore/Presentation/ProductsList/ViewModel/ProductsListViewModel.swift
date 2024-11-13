//
//  ProductsListViewModel.swift
//  FakeStore
//
//  Created by chandra sekhar p on 11/11/24.
//

import Foundation
import NetworkPackageManager

public final class ProductsListViewModel: ObservableObject {
    
    @Published private(set) var viewState: ViewState = .loading
    @Published private(set) var products: [Product] = []
    private(set) var errorMessage: String = ""
    private let productsListUseCase: ProductsListUseCase
    
    init(productsListUseCase: ProductsListUseCase = FetchProductsListUseCase()) {
        self.productsListUseCase = productsListUseCase
    }
}

extension ProductsListViewModel {
    @MainActor
    func getProducts() async {
        viewState = .loading
        do {
            let products = try await productsListUseCase.getProducts(limit: 20)
            handleProducts(products: products)
        } catch {
            handleErrors(error: error)
        }
    }
    
    func handleProducts(products: [Product]) {
        self.products.append(contentsOf: products)
        self.viewState = self.products.isEmpty ? .empty : .data
    }
    
    func handleErrors(error: Error) {
        if let _error = error as? ApiError, _error == .noNetwork {
            errorMessage = LocalizedStrings.noNetwork.localized
        }
        else {
            errorMessage = LocalizedStrings.somethingWentWrong.localized
        }
        print(error.localizedDescription)
        viewState = .error
    }
}
