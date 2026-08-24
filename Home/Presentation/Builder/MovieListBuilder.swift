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
        let viewModel: MovieListViewModel = DefaultMovieListViewModel()
        return MovieListView(viewModel: viewModel)
    }
}
