//
//  ProductsListView.swift
//  FakeStore
//
//  Created by chandra sekhar p on 10/11/24.
//

import SwiftUI

struct ProductsListView: View {
    
    @ObservedObject private var viewModel = ProductsListViewModel()
    let columns = [
        GridItem(alignment: .top),
        GridItem(alignment: .top)]
    
    init(viewModel: ProductsListViewModel = ProductsListViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            mainView()
        }
        .onAppear {
            viewModel.getProducts()
        }
    }
    
    @ViewBuilder
    func mainView() -> some View {
        switch viewModel.viewState {
        case .loading:
            VStack { ProgressView() }
        case .empty:
            FakeStoreEmptyView(description: LocalizedStrings.noProductsAvailable.localized)
        case .error:
            FakeStoreEmptyView(description: viewModel.errorMessage)
        case .data:
            NavigationView {
                layoutProducts(products: viewModel.products)
                    .navigationTitle(LocalizedStrings.productsListTitle.localized)
            }
        }
    }
}

extension ProductsListView {
    private func layoutProducts(products: [Product]) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 4) {
                ForEach(viewModel.products) { product in
                    NavigationLink(destination: productDetailView(product: product)) {
                        ProductListCard(product: product)
                    }
                }
            }
        }
        .clipped()
    }
    
    @ViewBuilder
    private func productDetailView(product: Product) -> some View {
        let productDetailViewModel = ProductDetailViewModel(product: product)
        ProductDetailView(viewModel: productDetailViewModel)
    }
}

#Preview {
    ProductsListView()
}
