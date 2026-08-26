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
        GridItem(.flexible(), spacing: 5, alignment: nil)
    ]
    let rows: [GridItem] = [
        GridItem(.flexible(), spacing: 20, alignment: nil)
    ]
    let topRatedrows: [GridItem] = [
        GridItem(.flexible(), spacing: 20, alignment: nil),
        GridItem(.flexible(), spacing: 20, alignment: nil)
    ]

    init(viewModel: MovieListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                BackgroundView()

                ScrollView {
                    LazyVStack(alignment: .leading) {
                        SectionHeadline(headline: "Now Playing")
                        ScrollView(.horizontal) {
                            LazyHGrid(
                                rows: rows,
                                spacing: 20,
                                pinnedViews: [.sectionHeaders]) {
                                    ForEach(0..<10) { _ in
                                        HeroStoryCard()
                                    }
                                }
                        }
                    }
                    .padding(.horizontal)

                    LazyVStack(alignment: .leading) {
                        SectionHeadline(headline: "Upcoming")
                        ScrollView(.horizontal) {
                            LazyHGrid(
                                rows: rows,
                                spacing: 10,
                                pinnedViews: [.sectionHeaders]) {
                                    ForEach(0..<10) { _ in
                                        BannerShelfRow()
                                    }
                                }
                        }
                    }
                    .padding(.horizontal)

                    LazyVStack(alignment: .leading) {
                        SectionHeadline(headline: "Top Rated")
                        ScrollView(.horizontal) {
                            LazyHGrid(
                                rows: topRatedrows,
                                spacing: 10,
                                pinnedViews: [.sectionHeaders]) {
                                    ForEach(0..<20) { _ in
                                        ShelfRow()
                                    }
                                }
                        }
                    }
                    .padding(.horizontal)

                    LazyVStack(alignment: .leading) {
                        SectionHeadline(headline: "Popular")
                        ScrollView(.horizontal) {
                            LazyHGrid(
                                rows: rows,
                                spacing: 20,
                                pinnedViews: [.sectionHeaders]) {
                                    ForEach(0..<10) { _ in
                                        BannerShelfRow()
                                    }
                                }
                        }
                    }
                    .padding(.horizontal)
                }
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
