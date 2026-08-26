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
            .frame(width: 120, height: 130)
            .aspectRatio(contentMode: .fill)
            .cornerRadius(5.0)
    }
}

#Preview {
    ShelfImage()
}
