//
//  AsyncImageLoader.swift
//  FakeStore
//
//  Created by chandra sekhar p on 12/11/24.
//

import SwiftUI

struct RemoteImage: View {
    let urlString: String?
    @State private var showImage = false

    var body: some View {
        if let urlString {
            AsyncImage(url: URL(string: urlString)) { phase in
                switch phase {
                case .empty:
                    placeholder()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .opacity(showImage ? 1 : 0.2)
                        .animation(.easeInOut(duration: 0.6), value: showImage)
                        .onAppear { showImage = true }
                case .failure:
                    placeholder()
                @unknown default:
                    EmptyView()
                }
            }
        }
        else {
            placeholder()
        }
    }
    
    private func placeholder() -> some View {
        Image(ImageNames.productPlaceHolder)
            .resizable()
            .transition(.opacity)
            .scaledToFit()
            .clipped()
    }
}
