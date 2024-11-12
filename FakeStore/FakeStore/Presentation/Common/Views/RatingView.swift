//
//  RatingView.swift
//  FakeStore
//
//  Created by chandra sekhar p on 12/11/24.
//

import SwiftUI


struct RatingView: View {
    
    let rating: Double
    
    var body: some View {
        HStack {
            Image(systemName: "star.fill")
            .resizable()
            .scaledToFit()
            .frame(maxHeight: .infinity)
            
            Text(String(format: "%.1f", rating))
                .bold()
                .minimumScaleFactor(0.5)
                .frame(maxHeight: .infinity)
        }
        .padding(.all, 0)
        .foregroundColor(rateColor(rate: rating))
    }
    
    private func rateColor(rate: Double) -> Color {
        switch rate {
        case 0..<2: return .red
        case 2..<3.5: return .orange
        default: return .green
        }
    }
}

#Preview {
    RatingView(rating: 3.6)
}
