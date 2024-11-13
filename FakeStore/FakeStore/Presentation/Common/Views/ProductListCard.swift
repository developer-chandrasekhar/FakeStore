//
//  ProductListCard.swift
//  FakeStore
//
//  Created by chandra sekhar p on 12/11/24.
//

import SwiftUI

struct ProductListCard: View {

    let product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            RemoteImage(urlString: product.image)
                .padding()
                .frame(maxWidth: .infinity)
            Spacer()
            Text(product.title)
                .lineLimit(3)
                .font(.system(size: 14, weight: .semibold))
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
                .foregroundStyle(.black)
            
            HStack {
                Text(String(format: "$%.2f", product.price))
                    .font(.system(size: 14))
                    .padding(.top, 2)
                    .foregroundStyle(.black)
                Spacer()
                if let rating = product.rating {
                    RatingView(rating: rating)
                        .frame(width: SizeConstants.ProductCard.ratingCardWidth,
                               height: SizeConstants.ProductCard.ratingCardHeight)
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        .frame(maxHeight: SizeConstants.ProductCard.cardHeight)
        .background(
            RoundedRectangle(cornerRadius: SizeConstants.ProductCard.cardRadius)
                .fill(.white)
                .shadow(color: .black.opacity(0.3), radius: 6, x: 1, y: 5)
        )
        .padding(.all, 6)
    }
}
