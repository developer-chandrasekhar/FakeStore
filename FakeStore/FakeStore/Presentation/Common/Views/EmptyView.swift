//
//  EmptyView.swift
//  FakeStore
//
//  Created by chandra sekhar p on 12/11/24.
//

import SwiftUI

struct FakeStoreEmptyView: View {
    
    let description: String
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text(description)
                    .bold()
                    .padding()
                Spacer()
            }
            Spacer()
        }.background(.black.opacity(0.05))
    }
}
