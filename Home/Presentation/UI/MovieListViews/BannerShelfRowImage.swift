//
//  BannerShelfRowImage.swift
//  CineVerse
//
//  Created by Admin on 26/08/26.
//

import SwiftUI

struct BannerShelfRowImage: View {
    var body: some View {
        Image("backdrop_path")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 170, height: 250)
            .clipped()
    }
}

#Preview {
    BannerShelfRowImage()
}
