//
//  ContentView.swift
//  CineVerse
//
//  Created by Admin on 30/06/26.
//

import SwiftUI
import SwiftData

struct MovieListView: View {

    @ObservedObject var viewModel: DefaultMovieListViewModel
    let rows: [GridItem] = [
        GridItem(.flexible(), spacing: 20, alignment: nil)
    ]
    let topRatedRows: [GridItem] = [
        GridItem(.flexible(), spacing: 20, alignment: nil),
        GridItem(.flexible(), spacing: 20, alignment: nil),
        GridItem(.flexible(), spacing: 20, alignment: nil)
    ]
    let upcomingRows: [GridItem] = [
        GridItem(.flexible(), spacing: 20, alignment: nil),
        GridItem(.flexible(), spacing: 20, alignment: nil)
    ]

    init(viewModel: DefaultMovieListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                BackgroundView()
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        SectionHeadline(headline: "Now Playing")
                        ScrollView(.horizontal) {
                            LazyHGrid(
                                rows: rows,
                                spacing: 20,
                                pinnedViews: [.sectionHeaders]) {
                                    ForEach(viewModel.nowPlayingMovieList) { movies in
                                        HeroStoryCard()
                                    }
                                 }
                        }
                    }
                    .padding(.horizontal)

                    LazyVStack(alignment: .leading) {
                        SectionHeadline(headline: "Upcoming")
                        ScrollView(.horizontal) {
                            LazyHGrid(
                                rows: upcomingRows,
                                spacing: 10,
                                pinnedViews: [.sectionHeaders]) {
                                    ForEach(viewModel.upcomingMovieList) { _ in
                                        BannerShelfRow()
                                    }
                                }
                        }
                    }
                    .padding(.horizontal)

                    LazyVStack(alignment: .leading) {
                        SectionHeadline(headline: "Top Rated")
                        ScrollView(.horizontal) {
                            LazyHGrid(
                                rows: topRatedRows,
                                spacing: 10,
                                pinnedViews: [.sectionHeaders]) {
                                    ForEach(viewModel.topRatedMovieList) { _ in
                                        ShelfRow()
                                    }
                                }
                        }
                    }
                    .padding(.horizontal)

                    LazyVStack(alignment: .leading) {
                        SectionHeadline(headline: "Popular")
                        ScrollView(.horizontal) {
                            LazyHGrid(
                                rows: rows,
                                spacing: 20,
                                pinnedViews: [.sectionHeaders]) {
                                    ForEach(viewModel.popularMovieList) { _ in
                                        BannerShelfRow()
                                    }
                                }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .onAppear {
                viewModel.fetchAllSections()
            }
            .navigationTitle(CineVerseText.cineVerseTitle)
        }
    }
}

#if DEBUG
#Preview {
    let repository: MovieListRepository = DefaultMovieListRepository()
    let useCase: MovieListUseCase = DefaultMovieListUseCase(repository: repository)
    let viewModel = DefaultMovieListViewModel(movieListUseCase: useCase)
    MovieListView(viewModel: viewModel)
}
#endif
