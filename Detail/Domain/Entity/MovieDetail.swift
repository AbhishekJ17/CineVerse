//
//  MovieDetail.swift
//  CineVerse
//
//  Created by Admin on 28/08/26.
//

struct MovieDetail: Decodable, Identifiable {
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

extension MovieDetail: Hashable {}
