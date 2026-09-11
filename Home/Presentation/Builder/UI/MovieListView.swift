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
                        HomeRowView(movieCategory: .upcoming, rows: upcomingRows, spacing: 10)
                        HomeRowView(movieCategory: .topRated, rows: topRatedRows, spacing: 10)
                        HomeRowView(movieCategory: .popular, rows: rows, spacing: 10)
                    }
                    .refreshable {
                        viewModel.fetchAllSections()
                    }
                }
            }
            .navigationTitle(CineVerseText.cineVerseTitle)
        }
        .searchable(
            text: $viewModel.searchText,
            isPresented: $viewModel.isSearchPresented,
            placement: .navigationBarDrawer,
            prompt: "Search Movies in CineVerse"
        )
        .environmentObject(viewModel)
    }
}

#if DEBUG
#Preview {
    let repository: MovieListRepository = DefaultMovieListRepository()
    let useCase: MovieListUseCase = DefaultMovieListUseCase(repository: repository)
    let searchUseCase: MovieSearchUseCase = DefaultMovieSearchUseCase(repository: repository)
    let viewModel = DefaultMovieListViewModel(
        movieListUseCase: useCase,
        movieSearchUseCase: searchUseCase
    )
    MovieListView(viewModel: viewModel)
}
#endif
