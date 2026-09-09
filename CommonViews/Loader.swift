//
//  Loader.swift
//  CineVerse
//
//  Created by Admin on 09/09/26.
//

import SwiftUI

struct Loader: View {
    var body: some View {
        ProgressView {
            Text("Loading")
                .font(.setThinFontWith(size: 13))
                .foregroundStyle(Color.textMuted)
        }
        .padding()
    }
}

#Preview {
    Loader()
}
