//
//  LocalizedStrings.swift
//  FakeStore
//
//  Created by chandra sekhar p on 12/11/24.
//

import SwiftUI

/// Enum representing keys for localized strings used in the app.
/// Each case corresponds to a specific localization key, allowing type-safe access

public enum LocalizedStrings: String {
    case productsListTitle = "ProductsListTitle"
    case noProductsAvailable = "EmptyProducts"
    case noNetwork = "NoNetwork"
    case somethingWentWrong = "SomethingWentWrong"
    case addToCartAlertBody = "addToCartAlertBody"
    case addToCartAlertOk = "addToCartAlertOk"
    
    /// Returns the localized string corresponding to the enum case.
    var localized: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
