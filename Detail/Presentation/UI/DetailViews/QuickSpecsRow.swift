//
//  QuickSpecsRow.swift
//  CineVerse
//
//  Created by Admin on 01/09/26.
//

import SwiftUI

struct QuickSpecsRow: View {

    var body: some View {
        HStack(spacing: 10) {
            Text("2026")
                .font(.setRegularFontWith(size: 15))
            Divider()
                .background(.textMuted)
                .frame(width: 5)
            Text("2h 41m")
                .font(.setRegularFontWith(size: 15))
            Divider()
                .background(.textMuted)
                .frame(width: 5)
            HStack(alignment: .center, spacing: 5) {
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundStyle(Color.yellow)
                Text("7.9/10")
                    .font(.setRegularFontWith(size: 15))
                Text("(2,218 votes)")
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
