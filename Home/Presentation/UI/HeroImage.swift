//
//  HeroImage.swift
//  CineVerse
//
//  Created by Admin on 25/08/26.
//

import SwiftUI

struct HeroImage: View {
    var body: some View {
        Image("backdrop_path")
            .resizable()
            .aspectRatio(5/4, contentMode: .fit)
            .cornerRadius(15)            
    }
}

#Preview {
    HeroImage()
}
