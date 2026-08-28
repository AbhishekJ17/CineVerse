//
//  ProductionCompanies.swift
//  CineVerse
//
//  Created by Admin on 28/08/26.
//

struct ProductionCompanies: Decodable, Identifiable {
    let id: Int
    let name: String
    let logo_path: String
    let origin_country: String
}

extension ProductionCompanies: Hashable {}
