//
//  CircularLogo.swift
//  CineVerse
//
//  Created by Admin on 02/09/26.
//

import SwiftUI

struct CircularLogo: View {
    let path: String

    var body: some View {
        CineVerseRemoteImage(path: path)
            .scaledToFit()
            .frame(width: 80, height: 80)
            .padding(.horizontal, 5)
            .padding(.vertical, 5)
            .background(Color.textPrimary)
            .border(Color.textMuted, width: 2)
            .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

#Preview {
    CircularLogo(path: "/71BqEFAF4V3qjjMPCpLuyJFB9A.png")
}
