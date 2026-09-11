//
//  SearchMovieCard.swift
//  CineVerse
//
//  Created by Admin on 11/09/26.
//

import SwiftUI

struct SearchMovieCard: View {
    var path: String
    var body: some View {
        CineVerseRemoteImage(path: path)
            .scaledToFill()
            .frame(height: 180)
            .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

#Preview {
    SearchMovieCard(path: "/2VK4d3mqqTc7LVZLnLPeRiPaJ71.jpg")
}
