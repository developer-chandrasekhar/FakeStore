//
//  ProductDetailViewModel.swift
//  FakeStore
//
//  Created by chandra sekhar p on 12/11/24.
//

import Foundation

public final class ProductDetailViewModel: ObservableObject {
   
    @Published private(set) var product: Product
    @Published private(set) var viewState: ViewState = .loading

    private var productDetailUseCase : ProductDetailUseCase
    
    init(productDetailUseCase: ProductDetailUseCase = FetchProductDetailUseCase(),
         product: Product) {
        self.productDetailUseCase = productDetailUseCase
        self.product = product
    }
}

extension ProductDetailViewModel {

    @MainActor
    func fetchDetailProduct() async {
        do {
            let product = try await productDetailUseCase.getProduct(byId: product.id)
            self.product = product
            self.viewState = .data
        }catch {
            self.viewState = .error
        }
    }
}

//MARK: Return mock use case while UITesting
extension ProductDetailViewModel {
    static func mockUseCase() -> ProductDetailUseCase? {
        if ProcessInfo.processInfo.arguments.contains("UITesting") {
            return MockProductDetailUseCase()
        }
        return nil
    }
}
