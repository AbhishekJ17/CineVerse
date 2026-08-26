//
//  ContentView.swift
//  CineVerse
//
//  Created by Admin on 30/06/26.
//

import SwiftUI
import SwiftData

struct MovieListView: View {

    var viewModel: MovieListViewModel
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 5, alignment: nil),
        GridItem(.flexible(), spacing: 5, alignment: nil)
    ]
    let rows: [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil)
    ]

    init(viewModel: MovieListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                BackgroundView()

                VStack(alignment: .leading) {
                    SectionHeadline(headline: "Now playing")
                    BannerShelfRow()
                }
                .padding(.leading, 20)
            }
            .navigationTitle(CineVerseText.cineVerseTitle)
        }
    }
}

#if DEBUG
#Preview {
    let viewModel: MovieListViewModel = DefaultMovieListViewModel()
    MovieListView(viewModel: viewModel)
}
#endif
