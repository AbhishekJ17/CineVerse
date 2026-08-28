//
//  SpokenLanguages.swift
//  CineVerse
//
//  Created by Admin on 28/08/26.
//

struct SpokenLanguage: Decodable {
    let iso_639_1: String
    let english_name: String
}

extension SpokenLanguage: Hashable {}
