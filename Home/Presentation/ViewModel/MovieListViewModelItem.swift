//
//  MovieListViewModelItem.swift
//  CineVerse
//
//  Created by Admin on 24/07/26.
//

struct MovieListViewModelItem {
    var title: String
    var overview: String
    var releaseDate: String
    var posterImagePath: String
}

extension MovieListViewModelItem {

    init(movie: Movie) {
        self.title = movie.title
        self.overview = movie.overview
        self.releaseDate = movie.release_date
        self.posterImagePath = movie.poster_path
    }
}


