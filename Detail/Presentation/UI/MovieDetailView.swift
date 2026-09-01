//
//  MovieDetailView.swift
//  CineVerse
//
//  Created by Admin on 28/08/26.
//

import SwiftUI
import Combine

struct MovieDetailView: View {

    @ObservedObject var viewModel: DefaultMovieDetailViewModel
    var movie: Movie?

    init(viewModel: DefaultMovieDetailViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                BackgroundView()
                    .ignoresSafeArea()
                ScrollView {
                    VStack(spacing: 0) {
                        HeroHeader(imagePath: "/oQRgyQCzcyZvE6w5heM9ktVY0LT.jpg")
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                TitleAndDescriptionView(
                                    title: "The Boy, the Mole, the Fox and the Horse",
                                    description: "A supernatural tale set on death row in a Southern prison, where gentle giant John Coffey possesses the mysterious power to heal people's ailments. When the cell block's head guard, Paul Edgecomb, recognizes Coffey's miraculous gift, he tries desperately to help stave off the condemned man's execution.")
                                Spacer()
                            }
                            QuickSpecsRow()
                        }
                        .padding(.leading, 10)
                    }
                }
                .ignoresSafeArea(edges: .top)
            }
        }
    }
}

#Preview {
    MovieDetailScreenBuilder.openMovieDetail(id: 123)
}
