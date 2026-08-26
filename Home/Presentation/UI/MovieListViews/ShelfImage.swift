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
            .aspectRatio(1/1, contentMode: .fit)
            .cornerRadius(5.0)
    }
}

#Preview {
    ShelfImage()
}
