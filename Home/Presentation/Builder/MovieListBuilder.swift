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
        let useCase: MovieListUseCase = DefaultMovieListUseCase(repository: repository)
        let viewModel = DefaultMovieListViewModel(movieListUseCase: useCase)
        return MovieListView(viewModel: viewModel)
    }
}
