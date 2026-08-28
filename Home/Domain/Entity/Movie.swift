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
    var genres: [Genre] = []
    var production_companies: [ProductionCompanies] = []
    var production_countries: [ProductionCountries] = []
    var spoken_languages: [SpokenLanguage] = []
    var adult = false
    var status: String
    var runtime: Int
    var revenue: Int32
    var original_language: String
    var origin_country: [String] = []
    var budget: Int32
    var popularity: Double
}

let dummyMovie = Movie(
    id: 1,
    title: "No Title",
    overview: "No Title",
    poster_path: "No Title",
    backdrop_path: "No Title",
    release_date: "No Title",
    vote_average: 12.3,
    vote_count: 12,
    status: "No Title",
    runtime: 123,
    revenue: 12345,
    original_language: "No Title",
    budget: 123789,
    popularity: 34.5
)

extension Movie: Hashable {}
