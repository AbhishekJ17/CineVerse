//
//  BannerShelfRow.swift
//  CineVerse
//
//  Created by Admin on 26/08/26.
//

import SwiftUI

struct BannerShelfRow: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            BannerShelfRowImage()
            BannerShelfMetadaView()
                .frame(width: 170)
        }
    }
}

#Preview {
    BannerShelfRow()
}
