//
//  QuickSpecsRow.swift
//  CineVerse
//
//  Created by Admin on 01/09/26.
//

import SwiftUI

struct QuickSpecsRow: View {

    var body: some View {
        HStack(spacing: 5) {
            Text("2026")
                .font(.setRegularFontWith(size: 15))
            Divider()
                .background(.textMuted)
                .frame(width: 5)
            Text("7.9")
                .font(.setRegularFontWith(size: 15))
            Divider()
                .background(.textMuted)
                .frame(width: 5)
            Text("2h 41m")
                .font(.setRegularFontWith(size: 15))
        }
        .foregroundStyle(.textMuted)
        .frame(height: 15)
    }
}

#Preview {
    QuickSpecsRow()
}
