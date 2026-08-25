//
//  HeroStoryCard.swift
//  CineVerse
//
//  Created by Admin on 25/08/26.
//

import SwiftUI

struct HeroStoryCard: View {
    var body: some View {
        HeroImage()
            .overlay(alignment: .topLeading) {
                PillTag()
                    .padding(.top, 10)
                    .padding(.leading, 10)
            }            
            .overlay(alignment: .bottomLeading) {

                VStack(alignment: .leading, spacing: 5) {
                    HeroCardTitle()
                    HStack(alignment: .center, spacing: 10) {
                        Imdb(rating: 7.9)
                        WatchTrailerButton()
                    }
                }
                .padding(.bottom, 10)
                .padding(.leading, 15)
            }
            .padding(.horizontal, 15)
    }
}

#Preview {
    HeroStoryCard()
}
