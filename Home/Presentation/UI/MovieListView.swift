//
//  ContentView.swift
//  CineVerse
//
//  Created by Admin on 30/06/26.
//

import SwiftUI
import SwiftData

struct MovieListView: View {

    var viewModel: MovieListViewModel

    init(viewModel: MovieListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                ScrollView {
                    LazyVStack(spacing: 20) {
                        VStack(alignment: .leading, spacing: 5) {
                            SectionHeadline(headline: "Now Playing")
                            HeroStoryCard()
                        }
                        VStack(alignment: .leading, spacing: 5) {
                            SectionHeadline(headline: "Popular")
                            HeroStoryCard()
                        }
                        VStack(alignment: .leading, spacing: 5) {
                            SectionHeadline(headline: "Top-Rated")
                            HeroStoryCard()
                        }
                        VStack(alignment: .leading, spacing: 5) {
                            SectionHeadline(headline: "Upcoming")
                            HeroStoryCard()
                        }
                    }
                }
            }
            .navigationTitle(CineVerseText.cineVerseTitle)
        }
    }
}

#if DEBUG
#Preview {
    let viewModel: MovieListViewModel = DefaultMovieListViewModel()
    MovieListView(viewModel: viewModel)
}
#endif
