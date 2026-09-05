//
//  HeroHeader.swift
//  CineVerse
//
//  Created by Admin on 01/09/26.
//

import SwiftUI

struct HeroHeader: View {
    @EnvironmentObject var viewModel: DefaultMovieDetailViewModel

    var body: some View {
        CineVerseRemoteImage(path: viewModel.movieDetail?.poster_path ?? "")
            .scaledToFill()
            .frame(height: 350)
            .clipped()
            .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    HeroHeader()
}
