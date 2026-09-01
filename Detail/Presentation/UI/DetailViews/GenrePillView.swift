//
//  GenrePillView.swift
//  CineVerse
//
//  Created by Admin on 01/09/26.
//

import SwiftUI

struct GenrePillView: View {

    var genreName: String
    var body: some View {
        Text(genreName)
            .font(.setRegularFontWith(size: 13))
            .padding()
            .frame(height: 25)
            .foregroundStyle(.textPrimary)
            .background(Color.textMuted).opacity(0.7)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
    }
}

#Preview {
    GenrePillView(genreName: "Action")
}
