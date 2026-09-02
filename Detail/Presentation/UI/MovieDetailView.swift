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
    var movie: Movie?
    let heroheaderRows: [GridItem] = [
        GridItem(.flexible(), spacing: 10, alignment: .leading)
    ]

    init(viewModel: DefaultMovieDetailViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                BackgroundView()
                    .ignoresSafeArea()
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ScrollView {
                            LazyVGrid(columns: heroheaderRows) {
                                HeroHeader(imagePath: "/oQRgyQCzcyZvE6w5heM9ktVY0LT.jpg")
                                VStack(alignment: .leading, spacing: 16) {
                                    HStack(spacing: 5) {
                                        TitleAndDescriptionView(
                                            title: "The Boy, the Mole, the Fox and the Horse",
                                            description: "A supernatural tale set on death row in a Southern prison, where gentle giant John Coffey possesses the mysterious power to heal people's ailments. When the cell block's head guard, Paul Edgecomb, recognizes Coffey's miraculous gift, he tries desperately to help stave off the condemned man's execution.")
                                        Spacer()
                                    }
                                    QuickSpecsRow()
                                    ScrollView(.horizontal) {
                                        HStack(spacing: 10) {
                                            ForEach(["Action", "Science Fiction", "Drama", "Comedy"], id: \.self) { genre in
                                                GenrePillView(genreName: genre)
                                            }
                                        }
                                    }
                                    HeroCardTitle(title: "Production Logos Shelf")
                                    ScrollView(.horizontal) {
                                        HStack(spacing: 10) {
                                            ForEach(["/71BqEFAF4V3qjjMPCpLuyJFB9A.png", "/nw4kyc29QRpNtFbdsBHkRSFavvt.png",
                                                     "/hUzeosd33nzE5MCNsZxCGEKTXaQ.png", "/qx9K6bFWJupwde0xQDwOvXkOaL8.png"], id: \.self) { imagePath in
                                                CircularLogo(imagePath: imagePath)
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
    }
}

#Preview {
    MovieDetailScreenBuilder.openMovieDetail(id: 123)
}
