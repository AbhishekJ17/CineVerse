//
//  JSONService.swift
//  CineVerse
//
//  Created by Admin on 17/07/26.
//

import Foundation

public protocol JSONService {
    func loadJSON<T: Decodable>(with fileName: String, type: T.Type) throws -> T?
}

enum DataSourceError: Error {
    case invalidURL
    case parsingError
}

final class JSONDataSourceProvider: JSONService {

    func loadJSON<T: Decodable>(with fileName: String, type: T.Type) throws -> T? {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            throw DataSourceError.invalidURL
        }
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(type, from: data)
        return decodedData
    }

    

}


