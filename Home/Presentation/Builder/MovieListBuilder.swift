//
//  MovieListBuilder.swift
//  CineVerse
//
//  Created by Admin on 24/08/26.
//
import Foundation
import SwiftUI

struct MovieListScreenBuilder {

    static func makeView() -> MovieListView {
        let repository: MovieListRepository = DefaultMovieListRepository()
        let listUseCase: MovieListUseCase = DefaultMovieListUseCase(repository: repository)
        let searchUseCase: MovieSearchUseCase = DefaultMovieSearchUseCase(repository: repository)
        let viewModel = DefaultMovieListViewModel(
            movieListUseCase: listUseCase,
            movieSearchUseCase: searchUseCase
        )
        return MovieListView(viewModel: viewModel)
    }
}
