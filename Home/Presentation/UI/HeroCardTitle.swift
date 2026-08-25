//
//  HeroCardTitle.swift
//  CineVerse
//
//  Created by Admin on 25/08/26.
//

import SwiftUI

struct HeroCardTitle: View {

    var title: String = "The GodFather: A New Era"
    var body: some View {
        Text(title)
            .font(.setBlackFontWith(size: 20))
            .foregroundStyle(.white)
    }
}

#Preview {
    HeroCardTitle(title: "The GodFather: A New Era")
}
