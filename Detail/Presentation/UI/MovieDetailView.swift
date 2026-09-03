//
//  MovieDetailView.swift
//  CineVerse
//
//  Created by Admin on 28/08/26.
//

import SwiftUI
import Combine

struct MovieDetailView: View {

    @ObservedObject var viewModel: DefaultMovieDetailViewModel
    let heroheaderRows: [GridItem] = [
        GridItem(.flexible(), spacing: 10, alignment: .leading)
    ]
    @State var isFavourite = false

    init(viewModel: DefaultMovieDetailViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                BackgroundView()
                    .ignoresSafeArea()
                if viewModel.loading {
                    ProgressView()
                }else {
                    ScrollView {
                        LazyVStack(alignment: .leading) {
                            ScrollView {
                                LazyVGrid(columns: heroheaderRows) {
                                    HeroHeader(imagePath: viewModel.movieDetail?.poster_path ?? "")
                                    VStack(alignment: .leading, spacing: 16) {
                                        HStack(spacing: 5) {
                                            TitleAndDescriptionView(
                                                title: viewModel.movieDetail?.title ?? "",
                                                description: viewModel.movieDetail?.overview ?? "")
                                            Spacer()
                                        }
                                        QuickSpecsRow(movieDetail: viewModel.movieDetail)
                                        TechnicalSpecs(movieDetail: viewModel.movieDetail)
                                        ScrollView(.horizontal, showsIndicators: false) {
                                            HStack(spacing: 10) {
                                                ForEach(viewModel.movieDetail?.genres ?? [], id: \.id) { genre in
                                                    GenrePillView(genreName: genre.name)
                                                }
                                            }
                                        }
                                        HeroCardTitle(title: "Production Logos Shelf")
                                        ScrollView(.horizontal, showsIndicators: false) {
                                            HStack(spacing: 10) {
                                                ForEach(viewModel.movieDetail?.production_companies ?? [], id: \.id) { production in
                                                    CircularLogo(imagePath: production.logo_path ?? "")
                                                }
                                            }
                                        }
                                    }
                                    .padding(.leading, 10)
                                    .padding(.trailing, 10)
                                }
                            }
                        }
                    }
                    .ignoresSafeArea(edges: .top)
                }
            }
            .onAppear {
                viewModel.fetchMovieDetail()
            }
            .navigationBarItems(trailing:
                Button(action: {
                    isFavourite.toggle()
                }, label: {
                    if isFavourite {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.accentPrimary)
                    }else {
                        Image(systemName: "heart")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                })
            )
        }
    }
}

#Preview {
    MovieDetailScreenBuilder.openMovieDetail(id: 969681)
}
