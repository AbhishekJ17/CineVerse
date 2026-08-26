//
//  HeroStoryCard.swift
//  CineVerse
//
//  Created by Admin on 25/08/26.
//

import SwiftUI

struct HeroStoryCard: View {
    var body: some View {
        VStack {
            HeroImage()
                .frame(height: 250)
            HStack(alignment: .top, spacing: 15) {
                HeroCardTitle(title: "The Godfather: A New ERA")
                Imdb(rating: 7.9)
            }
        }
        .frame(maxHeight: .infinity)
    }
}

#Preview {
    HeroStoryCard()
}
