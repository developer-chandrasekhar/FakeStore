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
        NavigationView {
            VStack(alignment: .leading) {
                if viewModel.viewState == .empty {
                    FakeStoreEmptyView(description: LocalizedStrings.noProductsAvailable.localized)
                }
                else if viewModel.products.count > 0 {
                    layoutProducts(products: viewModel.products)
                    
                }
            }
            .navigationTitle(LocalizedStrings.productsListTitle.localized)
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


