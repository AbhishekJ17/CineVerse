//
//  Pagination.swift
//  CineVerse
//
//  Created by Admin on 18/07/26.
//

struct MovieListResponse: Decodable {
    var page: Int
    var total_pages: Int32
    var total_results: Int32
    var results: [Movie]
}
