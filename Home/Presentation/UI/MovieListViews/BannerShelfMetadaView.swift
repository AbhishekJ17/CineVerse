//
//  BannerShelfMetadaView.swift
//  CineVerse
//
//  Created by Admin on 26/08/26.
//

import SwiftUI

struct BannerShelfMetadaView: View {
    var title: String
    var overview: String
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .font(.setBoldFontWith(size: 12))
                .foregroundStyle(.textPrimary)
            Text(overview)
                .font(.setBoldFontWith(size: 10))
                .foregroundStyle(.textPrimary)
                .lineLimit(2)
        }
        .padding(.horizontal, 5)
        .padding(.vertical, 5)
        .background(.black.gradient).opacity(0.50)
        .foregroundStyle(.textPrimary)
    }
}

#Preview {
    BannerShelfMetadaView(title: "The Godfather",
                          overview: "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.")
}
