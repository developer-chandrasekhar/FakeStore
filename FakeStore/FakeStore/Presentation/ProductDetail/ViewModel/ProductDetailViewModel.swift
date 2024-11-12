//
//  ProductDetailViewModel.swift
//  FakeStore
//
//  Created by chandra sekhar p on 12/11/24.
//

import Foundation

public final class ProductDetailViewModel: ObservableObject {
   
    @Published private(set) var product: Product
    @Published var isLoading = true
    private var productDetailUseCase : ProductDetailUseCase
    
    init(productDetailUseCase: ProductDetailUseCase = FetchProductDetailUseCase(),
         product: Product) {
        self.productDetailUseCase = productDetailUseCase
        self.product = product
    }
}

extension ProductDetailViewModel {
    @MainActor
    func fetchDetailProduct() {
        Task {
            do {
                let product = try await productDetailUseCase.getProduct(byId: product.id)
                self.product = product
                isLoading = false
            }
            catch {
                print(error)
                isLoading = false
            }
        }
    }
}
