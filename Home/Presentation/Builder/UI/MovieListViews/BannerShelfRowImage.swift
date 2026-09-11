//
//  BannerShelfRowImage.swift
//  CineVerse
//
//  Created by Admin on 26/08/26.
//

import SwiftUI

struct BannerShelfRowImage: View {
    let path: String

    var body: some View {
        CineVerseRemoteImage(path: path)
            .scaledToFill()
            .frame(width: 170, height: 250)
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    BannerShelfRowImage(path: "/qJ2tW6WMUDux911r6m7haRef0WH.jpg")
}
