//
//  DetailTitle.swift
//  CineVerse
//
//  Created by Admin on 01/09/26.
//

import SwiftUI

struct TitleAndDescriptionView: View {
    @EnvironmentObject var viewModel: DefaultMovieDetailViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(viewModel.movieDetail?.title ?? "")
                .font(.setBoldFontWith(size: 20))

            Text(viewModel.movieDetail?.overview ?? "")
                .font(.setItalicFontWith(size: 13))
        }
        .foregroundStyle(.textPrimary)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    TitleAndDescriptionView()
}
