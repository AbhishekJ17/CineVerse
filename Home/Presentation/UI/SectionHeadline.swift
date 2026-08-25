//
//  SectionHeadline.swift
//  CineVerse
//
//  Created by Admin on 25/08/26.
//

import SwiftUI

struct SectionHeadline: View {

    var headline: String
    var body: some View {
        Text(headline)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 15)
            .foregroundStyle(.textPrimary)
            .font(.setBlackFontWith(size: 25))
    }
}

#Preview {
    SectionHeadline(headline: "Now Playing")
}
