//
//  ShelfImage.swift
//  CineVerse
//
//  Created by Admin on 26/08/26.
//

import SwiftUI

struct ShelfImage: View {
    var body: some View {
        Image("poster_path")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 140, height: 160)
            .cornerRadius(5.0)
    }
}

#Preview {
    ShelfImage()
}
