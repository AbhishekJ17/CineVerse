//
//  Imdb.swift
//  CineVerse
//
//  Created by Admin on 25/08/26.
//

import SwiftUI

struct Imdb: View {

    var rating: Double
    var body: some View {
        Text(String(format: "%.1f", rating))
            .font(.setBoldFontWith(size: 12))
            .padding(.horizontal, 5)
            .padding(.vertical, 5)
            .background(Color.surfaceCard).opacity(0.7)
            .foregroundStyle(.textPrimary)
            .cornerRadius(5)
    }
}

#Preview {
    Imdb(rating: 7.9)
}
