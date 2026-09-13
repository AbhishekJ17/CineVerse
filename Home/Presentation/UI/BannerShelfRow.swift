//
//  BannerShelfRow.swift
//  CineVerse
//
//  Created by Admin on 26/08/26.
//

import SwiftUI

struct BannerShelfRow: View {

    var movie: Movie
    let onSelect: () -> Void
    var body: some View {
        ZStack(alignment: .bottom) {
            BannerShelfRowImage(path: movie.backdrop_path ?? "")
            BannerShelfMetadaView(title: movie.title, overview: movie.overview)
                .frame(width: 170)
        }
        .frame(width: 170)
        .contentShape(Rectangle())
        .onTapGesture {
            onSelect()
        }
    }
}

#Preview {
    BannerShelfRow(movie: dummyMovie, onSelect: {})
}
