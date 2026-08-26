//
//  WatchTrailerButton.swift
//  CineVerse
//
//  Created by Admin on 25/08/26.
//

import SwiftUI

struct WatchTrailerButton: View {

    var body: some View {
        Button {
            //action
        } label: {
            Text("Detail")
                .font(.setRegularFontWith(size: 12))
        }
        .foregroundStyle(.textPrimary)
        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
        .background(.accentPrimary)
        .cornerRadius(15)
    }
}

#Preview {
    WatchTrailerButton()
}
