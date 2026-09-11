//
//  ShelfImage.swift
//  CineVerse
//
//  Created by Admin on 26/08/26.
//

import SwiftUI

struct ShelfImage: View {
    let path: String

    var body: some View {
        CineVerseRemoteImage(path: path)
            .scaledToFill()
            .frame(width: 180, height: 180)
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    ShelfImage(path: "/qJ2tW6WMUDux911r6m7haRef0WH.jpg")
}
