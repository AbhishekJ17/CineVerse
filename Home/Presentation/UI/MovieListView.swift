//
//  ContentView.swift
//  CineVerse
//
//  Created by Admin on 30/06/26.
//

import SwiftUI
import SwiftData

struct MovieListView: View {

    @StateObject var viewModel: DefaultMovieListViewModel
    @State var selectedMovie: Movie?
    let rows: [GridItem] = [
        GridItem(.flexible(), spacing: 10, alignment: nil)
    ]
    let topRatedRows: [GridItem] = [
        GridItem(.flexible(), spacing: 10, alignment: nil),
        GridItem(.flexible(), spacing: 10, alignment: nil),
        GridItem(.flexible(), spacing: 10, alignment: nil)
    ]
    let upcomingRows: [GridItem] = [
        GridItem(.flexible(), spacing: 10, alignment: nil),
        GridItem(.flexible(), spacing: 10, alignment: nil)
    ]

    init(viewModel: DefaultMovieListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                BackgroundView()
                if viewModel.isLoading {
                    Loader()
                }else {
                    ScrollView {
                        HomeRowView(movieCategory: .nowPlaying, rows: rows, spacing: 10)

                        LazyVStack(alignment: .leading) {
                            SectionHeadline(headline: MovieCategory.upcoming.name)
                            if viewModel.isLoadingPage[.upcoming] ?? false {
                                Loader()
                            }else {
                                ScrollView(.horizontal) {
                                    LazyHGrid(
                                        rows: upcomingRows,
                                        spacing: 10,
                                        pinnedViews: [.sectionHeaders]) {
                                            ForEach(viewModel.getMovieListFrom(category: .upcoming)) { movie in
                                                BannerShelfRow(movie: movie) {
                                                    selectedMovie = movie
                                                }
                                            }
                                        }
                                        .scrollTargetLayout()
                                }
                                .scrollTargetBehavior(.viewAligned)
                                .scrollBounceBehavior(.basedOnSize)
                                .onScrollGeometryChange(for: Bool.self) { geometry in
                                    guard geometry.contentSize.width > 0 else { return false }

                                    let maxOffset = geometry.contentSize.width - geometry.containerSize.width
                                    let currentOffset = geometry.contentOffset.x
                                    let triggeredDistance: CGFloat = 100
                                    return currentOffset >= (maxOffset - triggeredDistance)
                                } action: { wasNearBottom, isNearBottom in
                                    guard isNearBottom else { return }
                                    if isNearBottom && !wasNearBottom {
                                        viewModel.loadNextPageFor(category: .upcoming)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)

                        LazyVStack(alignment: .leading) {
                            SectionHeadline(headline: MovieCategory.topRated.name)
                            if viewModel.isLoadingPage[.topRated] ?? false {
                                Loader()
                            }else {
                                ScrollView(.horizontal) {
                                    LazyHGrid(
                                        rows: topRatedRows,
                                        spacing: 10,
                                        pinnedViews: [.sectionHeaders]) {
                                            ForEach(viewModel.getMovieListFrom(category: .topRated)) { movie in
                                                ShelfRow(movie: movie) {
                                                    selectedMovie = movie
                                                }
                                            }
                                        }
                                        .scrollTargetLayout()
                                }
                                .scrollTargetBehavior(.viewAligned)
                                .scrollBounceBehavior(.basedOnSize)
                                .onScrollGeometryChange(for: Bool.self) { geometry in
                                    guard geometry.contentSize.width > 0 else { return false }

                                    let maxOffset = geometry.contentSize.width - geometry.containerSize.width
                                    let currentOffset = geometry.contentOffset.x
                                    let triggeredDistance: CGFloat = 100
                                    return currentOffset >= (maxOffset - triggeredDistance)
                                } action: { wasNearBottom, isNearBottom in
                                    guard isNearBottom else { return }
                                    if isNearBottom && !wasNearBottom {
                                        viewModel.loadNextPageFor(category: .topRated)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)

                        LazyVStack(alignment: .leading) {
                            SectionHeadline(headline: MovieCategory.popular.name)
                            if viewModel.isLoadingPage[.popular] ?? false {
                                Loader()
                            }else {
                                ScrollView(.horizontal) {
                                    LazyHGrid(
                                        rows: rows,
                                        spacing: 10,
                                        pinnedViews: [.sectionHeaders]) {
                                            ForEach(viewModel.getMovieListFrom(category: .popular)) { movie in
                                                BannerShelfRow(movie: movie) {
                                                    selectedMovie = movie
                                                }
                                            }
                                        }
                                        .scrollTargetLayout()
                                }
                                .scrollTargetBehavior(.viewAligned)
                                .scrollBounceBehavior(.basedOnSize)
                                .onScrollGeometryChange(for: Bool.self) { geometry in
                                    guard geometry.contentSize.width > 0 else { return false }

                                    let maxOffset = geometry.contentSize.width - geometry.containerSize.width
                                    let currentOffset = geometry.contentOffset.x
                                    let triggeredDistance: CGFloat = 100
                                    return currentOffset >= (maxOffset - triggeredDistance)
                                } action: { wasNearBottom, isNearBottom in
                                    guard isNearBottom else { return }
                                    if isNearBottom && !wasNearBottom {
                                        viewModel.loadNextPageFor(category: .popular)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    .refreshable {
                        viewModel.fetchAllSections()
                    }
                }
            }
            .navigationTitle(CineVerseText.cineVerseTitle)
            .navigationDestination(item: $selectedMovie) { movie in
                MovieDetailScreenBuilder.openMovieDetail(id: movie.id)
            }
        }
        .environmentObject(viewModel)
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
