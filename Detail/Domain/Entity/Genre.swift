//
//  Genre.swift
//  CineVerse
//
//  Created by Admin on 28/08/26.
//

struct Genre: Decodable, Identifiable {
    let id: Int
    let name: String
}

extension Genre: Hashable {}
