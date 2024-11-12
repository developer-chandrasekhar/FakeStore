//
//  ProductListCard.swift
//  FakeStore
//
//  Created by chandra sekhar p on 12/11/24.
//

import SwiftUI

struct ProductListCard: View {
    private struct SizeClass {
        let cardHeight: CGFloat = 250
        let cardRadius: CGFloat = 10
        let ratingCardWidth: CGFloat = 56
        let ratingCardHeight: CGFloat = 20
    }
    let product: Product
    private let sizeClass = SizeClass()
    
    var body: some View {
        VStack {
            Spacer()
            RemoteImage(urlString: product.image)
                .padding()
            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    Text(product.title)
                        .lineLimit(3)
                        .font(.system(size: 14, weight: .semibold))
                    HStack {
                        Text(String(format: "$%.2f", product.price))
                            .font(.system(size: 14))
                            .padding(.top, 2)
                        Spacer()
                        if let rating = product.rating {
                            RatingView(rating: rating)
                                .frame(width: sizeClass.ratingCardWidth, height: sizeClass.ratingCardHeight)
                        }
                    }
                }
                .padding()
                Spacer()
            }
        }
        .frame(maxHeight: sizeClass.cardHeight)
        .background(
            RoundedRectangle(cornerRadius: sizeClass.cardRadius)
                .fill(.white)
                .shadow(color: .black.opacity(0.3), radius: 6, x: 1, y: 5)
        )
        .padding(.all, 6)
    }
}
