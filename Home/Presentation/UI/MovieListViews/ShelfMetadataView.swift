//
//  ShelfMetadataView.swift
//  CineVerse
//
//  Created by Admin on 26/08/26.
//

import SwiftUI

struct ShelfMetadataView: View {

    var title: String
    var rating: Double
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .font(.setRegularFontWith(size: 12))
                .foregroundStyle(.textPrimary)
                .lineLimit(2)
            Text("\(String(format: "%g", rating))/10")
                .font(.setRegularFontWith(size: 10))
                .foregroundStyle(.textMuted)
        }
    }
}

#Preview {
    ShelfMetadataView(title: "The GodFather: A New Era",
                      rating: 7.9)
}
