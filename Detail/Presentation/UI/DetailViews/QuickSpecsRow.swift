//
//  QuickSpecsRow.swift
//  CineVerse
//
//  Created by Admin on 01/09/26.
//

import SwiftUI

struct QuickSpecsRow: View {

    var movieDetail: MovieDetail?

    var body: some View {
        HStack(spacing: 10) {
            Text(movieDetail?.release_date.releaseYear ?? "")
                .font(.setRegularFontWith(size: 15))
            Divider()
                .background(.textMuted)
                .frame(width: 5)
            Text(movieDetail?.runtime.formattedRuntime ?? "")
                .font(.setRegularFontWith(size: 15))
            Divider()
                .background(.textMuted)
                .frame(width: 5)
            HStack(alignment: .center, spacing: 5) {
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundStyle(Color.yellow)
                Text(String(format: "%.1f", movieDetail?.vote_average ?? 0) + "/10")
                    .font(.setRegularFontWith(size: 15))
                Text("(\(movieDetail?.vote_count.formattedWithCommas ?? "") votes)")
                    .font(.setRegularFontWith(size: 15))
            }
        }
        .foregroundStyle(.textMuted)
        .frame(height: 15)
    }
}

#Preview {
    QuickSpecsRow()
}
