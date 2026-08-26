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
                            SectionHeadline(headline: "Top Rated")
                            HStack(spacing: 5) {
                                BannerShelfRow()
                                BannerShelfRow()
                            }
                            SectionHeadline(headline: "Popular")
                            HStack(spacing: 5) {
                                ShelfRow()
                                ShelfRow()
                                ShelfRow()
                            }
                            SectionHeadline(headline: "Upcoming")
                            HStack(spacing: 5) {
                                ShelfRow()
                                ShelfRow()
                            }
                        }
                        .padding(.horizontal, 15)
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
