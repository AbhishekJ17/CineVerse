//
//  HeroStoryCard.swift
//  CineVerse
//
//  Created by Admin on 25/08/26.
//

import SwiftUI

struct HeroStoryCard: View {

    var movie: Movie
    let onSelect: () -> Void
    private var cardWidth: CGFloat {
        UIScreen.main.bounds.width * 0.8
    }
    var body: some View {
        VStack(alignment: .leading) {
            HeroImage(imagePath: movie.poster_path)
            HStack(alignment: .top, spacing: 15) {
                HeroCardTitle(title: movie.title)
                Imdb(rating: movie.vote_average)
            }
        }
        .frame(width: cardWidth)
        .onTapGesture {
            onSelect()
        }
    }
}

#Preview {
    HeroStoryCard(movie: dummyMovie, onSelect: {})
}
