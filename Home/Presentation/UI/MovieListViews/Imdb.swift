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
        VStack(alignment: .leading, spacing: 2) {
            Text("IMDB")
                .font(.setBlackFontWith(size: 15))
            Text(String(format: "%g", rating))
                .font(.setBlackFontWith(size: 12))
        }
        .padding(.horizontal, 5)
        .padding(.vertical, 5)
        .background(Color.accentSecondary).opacity(0.7)
        .foregroundStyle(.textPrimary)
        .cornerRadius(5)
    }
}

#Preview {
    Imdb(rating: 7.9)
}
