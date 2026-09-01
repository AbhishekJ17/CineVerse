//
//  DetailTitle.swift
//  CineVerse
//
//  Created by Admin on 01/09/26.
//

import SwiftUI

struct TitleAndDescriptionView: View {
    var title: String
    var description: String

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.setBoldFontWith(size: 20))

            Text(description)
                .font(.setItalicFontWith(size: 13))
        }
        .foregroundStyle(.textPrimary)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    TitleAndDescriptionView(title: "The Boy, the Mole, the Fox and the Horse",
              description: "A supernatural tale set on death row in a Southern prison, where gentle giant John Coffey possesses the mysterious power to heal people's ailments. When the cell block's head guard, Paul Edgecomb, recognizes Coffey's miraculous gift, he tries desperately to help stave off the condemned man's execution.")
}
