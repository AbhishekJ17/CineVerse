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

    init() {
        // Customize UIKit Navigation Bar appearance for white titles
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()

        // Force title colors to pure white (#FFFFFF)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some Scene {
        WindowGroup {
            MovieListScreenBuilder.makeView()
        }
    }
}
