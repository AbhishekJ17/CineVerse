//
//  PillTag.swift
//  CineVerse
//
//  Created by Admin on 25/08/26.
//

import SwiftUI

struct PillTag: View {
    var body: some View {
        Text("Featured Premier")
            .textCase(.uppercase)
            .font(.setMediumFontWith(size: 12))
            .frame(height: 10)
            .foregroundStyle(Color.white)
            .padding(.horizontal, 5)
            .padding(.vertical, 3)
            .background(.textMuted)
            .clipShape(Capsule())
    }
}

#Preview {
    PillTag()
}
