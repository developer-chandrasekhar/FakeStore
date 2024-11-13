//
//  ProductDetailView.swift
//  FakeStore
//
//  Created by chandra sekhar p on 12/11/24.
//

import SwiftUI

struct ProductDetailView: View {
    
    private struct SizeClass {
        let imageMaxHeight: CGFloat = 300
        let spacerMinLengthToAddToCart: CGFloat = 100
        let ratingCardWidth: CGFloat = 100
        let ratingCardHeight: CGFloat = 20
        let productPriceTopPadding: CGFloat = 2
        let cartButtonCornerRadius: CGFloat = 5
        let cartButtonHeight: CGFloat = 44
    }
    
    @ObservedObject private var viewModel: ProductDetailViewModel
    @State private var showAddToCartAlert: Bool = false
    private let sizeClass = SizeClass()

    init(viewModel: ProductDetailViewModel) {
        // While UITesting mock use case is created
        if let mockUseCase = ProductDetailViewModel.mockUseCase() {
            self.viewModel = ProductDetailViewModel(productDetailUseCase: mockUseCase, product: viewModel.product)
        }
        else {
            self.viewModel = viewModel
        }
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
                .frame(maxHeight: sizeClass.imageMaxHeight)
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
                    .padding(.top, sizeClass.productPriceTopPadding)
                Spacer()
                if let rating = product.rating {
                    RatingView(rating: rating)
                        .frame(width: sizeClass.ratingCardWidth, height: sizeClass.ratingCardHeight)
                }
            }
            Spacer(minLength: sizeClass.spacerMinLengthToAddToCart)
            addToCartButton()
        }
    }
    
    private func addToCartButton() -> some View {
        HStack {
            Spacer()
            Button("Add to Cart") {
                showAddToCartAlert.toggle()
            }
            .frame(height: sizeClass.cartButtonHeight)
            .foregroundStyle(.white)
            .bold()
            Spacer()
        }
        .background(
            RoundedRectangle(cornerRadius: sizeClass.cartButtonCornerRadius)
                .fill(.cyan)
        )
    }
}

#Preview {
    ProductDetailView(viewModel: ProductDetailViewModel(productDetailUseCase: MockProductDetailUseCase(), product: Product.getFakeProduct()))
}
