//
//  ProductsListView.swift
//  FakeStore
//
//  Created by chandra sekhar p on 10/11/24.
//

import SwiftUI

struct ProductsListView: View {
    @ObservedObject var viewModel = ProductsListViewModel()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                viewModel.getProducts()
            }
    }
}

#Preview {
    ProductsListView()
}
