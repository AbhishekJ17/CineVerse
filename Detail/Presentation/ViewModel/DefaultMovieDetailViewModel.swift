//
//  MovieDetailViewModel.swift
//  CineVerse
//
//  Created by Admin on 28/08/26.
//

import Foundation
import Combine
protocol MovieDetailViewModelInput {
    func fetchMovieDetail()
}

protocol MovieDetailViewModelOutput {
    var movieDetail: MovieDetail? { get set }
    var loading: Bool { get set }
    var errorMessage: String { get set }
    var movieId: Int32 { get }
}

typealias MovieDetailViewModel = MovieDetailViewModelInput & MovieDetailViewModelOutput

@MainActor
final class DefaultMovieDetailViewModel: MovieDetailViewModel, ObservableObject {

    @Published var movieDetail: MovieDetail?
    @Published var loading: Bool = true
    @Published var errorMessage: String = ""

    private let useCase: MovieDetailUseCase
    let movieId: Int32

    init(movieId: Int32, useCase: MovieDetailUseCase) {
        self.movieId = movieId
        self.useCase = useCase
    }

    func fetchMovieDetail() {
        Task {
            do {
                let movieDetail = try await useCase.execute(movieId: movieId)
                self.movieDetail = movieDetail
                self.loading = false
            } catch let error as APIError {
                self.errorMessage = error.message
            }
        }
    }
}
