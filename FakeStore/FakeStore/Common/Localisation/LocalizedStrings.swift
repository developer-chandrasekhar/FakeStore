//
//  LocalizedStrings.swift
//  FakeStore
//
//  Created by chandra sekhar p on 12/11/24.
//

import SwiftUI

public enum LocalizedStrings: String {
    case productsListTitle = "ProductsListTitle"
    case noProductsAvailable = "EmptyProducts"
    case noNetwork = "NoNetwork"
    case somethingWentWrong = "SomethingWentWrong"
    case addToCartAlertBody = "addToCartAlertBody"
    case addToCartAlertOk = "addToCartAlertOk"
    
    var localized: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
