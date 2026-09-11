//
//  HeroImage.swift
//  CineVerse
//
//  Created by Admin on 25/08/26.
//

import SwiftUI

struct HeroImage: View {
    let path: String
    var body: some View {
        CineVerseRemoteImage(path: path)
            .scaledToFill()
            .frame(height: 250)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
    }
}

#Preview {
    HeroImage(path: "/qJ2tW6WMUDux911r6m7haRef0WH.jpg")
}
