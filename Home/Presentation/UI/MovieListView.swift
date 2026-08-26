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
                            HStack(alignment: .center) {
                                ShelfRow()
                                ShelfRow()
                                ShelfRow()
                            }
                        }
                        VStack(alignment: .leading, spacing: 5) {
                            SectionHeadline(headline: "Top Rated")
                            HStack(alignment: .center) {
                                ShelfRow()
                                ShelfRow()
                                ShelfRow()
                            }
                        }
                        VStack(alignment: .leading, spacing: 5) {
                            SectionHeadline(headline: "Upcoming")
                            HStack(alignment: .center) {
                                BannerShelfRow()
                                BannerShelfRow()
                            }
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
