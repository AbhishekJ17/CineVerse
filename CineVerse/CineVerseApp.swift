//
//  CineVerseApp.swift
//  CineVerse
//
//  Created by Admin on 30/06/26.
//

import SwiftUI
import SwiftData

@main
struct CineVerseApp: App {
    var body: some Scene {
        WindowGroup {
            MovieListScreenBuilder.makeView()
        }
    }
}
