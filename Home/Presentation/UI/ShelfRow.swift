//
//  ShelfRow.swift
//  CineVerse
//
//  Created by Admin on 26/08/26.
//

import SwiftUI

struct ShelfRow: View {
    var body: some View {
        ZStack {
            VStack(spacing: 5) {
                ShelfImage()
                ShelfMetadataView(title: "The GodFather: A New Era", rating: 7.9)
            }
            .frame(width: 120, height: 150)
        }
    }
}

#Preview {
    ShelfRow()
}
