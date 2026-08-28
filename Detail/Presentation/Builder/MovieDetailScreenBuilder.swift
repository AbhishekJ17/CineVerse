//
//  MovieDetailScreenBuilder.swift
//  CineVerse
//
//  Created by Admin on 28/08/26.
//

struct MovieDetailScreenBuilder {

    static func openMovieDetail(id: Int32) -> MovieDetailView {
        let repository: MovieDetailRepository = DefaultMovieDetailRepository()
        let usecase: MovieDetailUseCase = DefaultMovieDetailuseCase(movieDetailRepository: repository)
        let viewModel = DefaultMovieDetailViewModel(movieId: id, useCase: usecase)
        return MovieDetailView(viewModel: viewModel)
    }
}
