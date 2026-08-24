//
//  Movie.swift
//  CineVerse
//
//  Created by Admin on 18/07/26.
//

struct Movie: Decodable {
    var id: Int32
    var title: String
    var overview: String
    var poster_path: String
    var release_date: String
    var vote_average: Double
    var vote_count: Int
}
