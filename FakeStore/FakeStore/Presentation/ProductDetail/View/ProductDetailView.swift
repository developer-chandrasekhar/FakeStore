//
//  ProductDetailView.swift
//  FakeStore
//
//  Created by chandra sekhar p on 12/11/24.
//

import SwiftUI

struct ProductDetailView: View {
    
    @ObservedObject private var viewModel: ProductDetailViewModel
    @State private var showAddToCartAlert: Bool = false

    init(viewModel: ProductDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                mainView(product: viewModel.product)
                    .padding()
                if viewModel.viewState == .loading {
                    ProgressView()
                }
            }
        }
        .clipped()
        .task {
            await viewModel.fetchDetailProduct()
        }
        .alert(LocalizedStrings.addToCartAlertBody.localized, isPresented: $showAddToCartAlert) {
            Button(LocalizedStrings.addToCartAlertOk.localized, role: .cancel) {}
        }
    }
}

extension ProductDetailView {
    private func mainView(product: Product) -> some View {
        VStack(alignment: .leading) {
            
            RemoteImage(urlString: product.image)
                .padding()
                .frame(maxHeight: SizeConstants.ProductDetailView.imageMaxHeight)
                .frame(maxWidth: .infinity)
            
            Text(viewModel.product.title)
                .font(.title2)
                .bold()
            if let _category = product.category {
                Text(_category)
                    .font(.body)
                    .foregroundStyle(.primary)
            }
            if let _description = product.description {
                Text(_description)
                    .font(.body)
                    .foregroundStyle(.secondary)
            }
            HStack {
                Text(String(format: "$%.2f", product.price))
                    .font(.title2)
                    .padding(.top, 2)
                Spacer()
                if let rating = product.rating {
                    RatingView(rating: rating)
                        .frame(width: SizeConstants.ProductDetailView.ratingCardWidth,
                               height: SizeConstants.ProductDetailView.ratingCardHeight)
                }
            }
            Spacer(minLength: SizeConstants.ProductDetailView.spacerMinLengthToAddToCart)
            addToCartButton()
        }
    }
    
    private func addToCartButton() -> some View {
        HStack {
            Spacer()
            Button("Add to Cart") {
                showAddToCartAlert.toggle()
            }
            .frame(height: SizeConstants.ProductDetailView.cartButtonHeight)
            .foregroundStyle(.white)
            .bold()
            Spacer()
        }
        .background(
            RoundedRectangle(cornerRadius: SizeConstants.ProductDetailView.cartButtonCornerRadius)
                .fill(.cyan)
        )
    }
}

#Preview {
    ProductDetailView(viewModel: ProductDetailViewModel(productDetailUseCase: MockProductDetailUseCase(), product: Product.getFakeProduct()))
}
