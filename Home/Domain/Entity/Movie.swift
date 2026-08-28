//
//  Movie.swift
//  CineVerse
//
//  Created by Admin on 18/07/26.
//

struct Movie: Decodable, Identifiable {
    var id: Int32
    var title: String
    var overview: String
    var poster_path: String
    var backdrop_path: String
    var release_date: String
    var vote_average: Double
    var vote_count: Int
}

let dummyMovie = Movie(
    id: 1,
    title: "No Title",
    overview: "No Title",
    poster_path: "No Title",
    backdrop_path: "",
    release_date: "No Title",
    vote_average: 4.3,
    vote_count: 123
)

extension Movie: Hashable {}
