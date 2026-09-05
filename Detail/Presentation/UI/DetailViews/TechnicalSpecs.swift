//
//  TechnicalSpecs.swift
//  CineVerse
//
//  Created by Admin on 02/09/26.
//

import SwiftUI

struct TechnicalSpecs: View {
    @EnvironmentObject var viewModel: DefaultMovieDetailViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Technical Specs")
                .font(.setMediumFontWith(size: 18))
                .foregroundStyle(.white)

            HStack(alignment: .top, spacing: 30) {
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Budget:")
                            .font(.setRegularFontWith(size: 13))
                            .foregroundStyle(Color.textMuted)
                        Text(viewModel.movieDetail?.budget.formattedAsCurrency ?? "0")
                            .font(.setMediumFontWith(size: 15))
                            .foregroundStyle(.textPrimary)
                    }
                    .foregroundStyle(.textPrimary)

                    VStack(alignment: .leading, spacing: 5) {
                        Text("Status:")
                            .font(.setRegularFontWith(size: 13))
                            .foregroundStyle(Color.textMuted)
                        Text(viewModel.movieDetail?.status ?? "")
                            .font(.setMediumFontWith(size: 15))
                            .foregroundStyle(.textPrimary)
                    }
                    .foregroundStyle(.textPrimary)
                }
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Box Office Revenue:")
                            .font(.setRegularFontWith(size: 13))
                            .foregroundStyle(Color.textMuted)
                        Text(viewModel.movieDetail?.revenue.formattedAsCurrency ?? "0")
                            .font(.setMediumFontWith(size: 15))
                            .foregroundStyle(.textPrimary)
                    }
                    .foregroundStyle(.textPrimary)

                    VStack(alignment: .leading, spacing: 5) {
                        Text("Original Language:")
                            .font(.setRegularFontWith(size: 13))
                            .foregroundStyle(Color.textMuted)
                        Text(viewModel.movieDetail?.original_language ?? "")
                            .font(.setMediumFontWith(size: 15))
                            .foregroundStyle(.textPrimary)
                    }
                    .foregroundStyle(.textPrimary)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.surfaceCard)
        .cornerRadius(15)
    }
}

#Preview {
    TechnicalSpecs()
}
