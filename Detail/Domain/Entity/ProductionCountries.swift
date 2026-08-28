//
//  ProductionCountries.swift
//  CineVerse
//
//  Created by Admin on 28/08/26.
//

struct ProductionCountries: Decodable {
    let iso_3166_1: String
    let name: String
}

extension ProductionCountries: Hashable {}
