//
//  SizeConstants.swift
//  FakeStore
//
//  Created by chandra sekhar p on 13/11/24.
//

import Foundation

/// A struct to maintain reusable size constants for various UI components.
/// If sizes are specific to a class, they can be maintained within the view itself.
struct SizeConstants {
   
    // Prevents instantiation
    private init() {}
    
    static let smallCornerRadius: CGFloat = 5
    static let mediumCornerRadius: CGFloat = 10
    static let largeCornerRadius: CGFloat = 15

    /// Product card size constants
    struct ProductCard {
        private init() {}
        static let cardHeight: CGFloat = 250
        static let cardRadius: CGFloat = SizeConstants.mediumCornerRadius
        static let ratingCardWidth: CGFloat = 56
        static let ratingCardHeight: CGFloat = 20
    }
    
    /// Product detail size constants
    struct ProductDetailView {
        private init() {}
        static let imageMaxHeight: CGFloat = 300
        static let spacerMinLengthToAddToCart: CGFloat = 100
        static let ratingCardWidth: CGFloat = 100
        static let ratingCardHeight: CGFloat = 20
        static let ratingCardRadius: CGFloat = SizeConstants.mediumCornerRadius
        static let cartButtonCornerRadius: CGFloat = SizeConstants.smallCornerRadius
        static let cartButtonHeight: CGFloat = 44
    }
}
