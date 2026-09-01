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
                ScrollView {
                    HeroHeader(imagePath: "/oQRgyQCzcyZvE6w5heM9ktVY0LT.jpg")
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    MovieDetailScreenBuilder.openMovieDetail(id: 123)
}
