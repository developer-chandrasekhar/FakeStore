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
            if viewModel.viewState == .loading {
                VStack {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
            }
            else if viewModel.viewState == .empty {
                FakeStoreEmptyView(description: LocalizedStrings.noProductsAvailable.localized)
            }
            else if viewModel.viewState == .error {
                FakeStoreEmptyView(description: viewModel.errorMessage)
            }
            else if viewModel.products.count > 0 {
                NavigationView {
                    layoutProducts(products: viewModel.products)
                        .navigationTitle(LocalizedStrings.productsListTitle.localized)
                }
            }
        }
        .onAppear {
            viewModel.getProducts()
        }
    }
}

extension ProductsListView {
    func layoutProducts(products: [Product]) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 4) {
                ForEach(viewModel.products) { product in
                    ProductListCard(product: product)
                }
            }
        }
        .clipped()
    }
}

#Preview {
    ProductsListView()
}
