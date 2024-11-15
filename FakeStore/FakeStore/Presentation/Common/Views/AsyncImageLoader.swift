//
//  AsyncImageLoader.swift
//  FakeStore
//
//  Created by chandra sekhar p on 12/11/24.
//

import SwiftUI
import Kingfisher

/// A custom SwiftUI `View` to display an image fetched from a remote URL.
struct RemoteImage: View {
    let urlString: String?
    @State private var showImage = false
    
    var body: some View {
        KFImage(URL(string: urlString ?? ""))
            .placeholder {
                placeholder()
            }
            .resizable()
            .transition(.opacity)
            .scaledToFit()
            .clipped()
    }
    
    private func placeholder() -> some View {
        Image(ImageNames.productPlaceHolder)
            .resizable()
            .transition(.opacity)
            .scaledToFit()
            .clipped()
    }
}
