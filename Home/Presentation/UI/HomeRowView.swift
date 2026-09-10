//
//  HomeRowView.swift
//  CineVerse
//
//  Created by Admin on 10/09/26.
//
import SwiftUI

struct HomeRowView: View {

    @EnvironmentObject var viewModel: DefaultMovieListViewModel
    @State var selectedMovie: Movie?
    var movieCategory: MovieCategory
    var rows: [GridItem] = []
    var spacing: CGFloat = 10

    var body: some View {
        LazyVStack(alignment: .leading) {
            SectionHeadline(headline: movieCategory.name)
            if viewModel.isLoadingPage[movieCategory] ?? false {
                Loader()
            }else {
                ScrollView(.horizontal) {
                    LazyHGrid(
                        rows: rows,
                        spacing: spacing,
                        pinnedViews: [.sectionHeaders]) {
                            ForEach(viewModel.getMovieListFrom(category: movieCategory)) { movie in
                                HeroStoryCard(movie: movie) {
                                    selectedMovie = movie
                                }
                            }
                        }
                        .scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned)
                .scrollBounceBehavior(.basedOnSize)
                .onScrollGeometryChange(for: Bool.self) { geometry in
                    guard geometry.contentSize.width > 0 else { return false }

                    let maxOffset = geometry.contentSize.width - geometry.containerSize.width
                    let currentOffset = geometry.contentOffset.x
                    let triggeredDistance: CGFloat = 100
                    return currentOffset >= (maxOffset - triggeredDistance)
                } action: { wasNearBottom, isNearBottom in
                    guard isNearBottom else { return }
                    if isNearBottom && !wasNearBottom {
                        viewModel.loadNextPageFor(category: movieCategory)
                    }
                }
            }
        }
        .padding(.horizontal)
        .navigationDestination(item: $selectedMovie) { movie in
            MovieDetailScreenBuilder.openMovieDetail(id: movie.id)
        }
    }
}


#Preview {
    HomeRowView(movieCategory: .nowPlaying)
}
