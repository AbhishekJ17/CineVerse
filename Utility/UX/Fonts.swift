//
//  Fonts.swift
//  CineVerse
//
//  Created by Admin on 25/08/26.
//

import SwiftUI

extension Font {

    static func setBlackFontWith(size: CGFloat) -> Font {
        return Font.custom("Roboto-Black", size: size)
    }

    static func setBoldFontWith(size: CGFloat) -> Font {
        return Font.custom("Roboto-Bold", size: size)
    }

    static func setItalicFontWith(size: CGFloat) -> Font {
        return Font.custom("Roboto-Italic", size: size)
    }

    static func setLightFontWith(size: CGFloat) -> Font {
        return Font.custom("Roboto-Light", size: size)
    }

    static func setMediumFontWith(size: CGFloat) -> Font {
        return Font.custom("Roboto-Medium", size: size)
    }

    static func setSemiBoldFontWith(size: CGFloat) -> Font {
        return Font.custom("Roboto-SemiBold", size: size)
    }

    static func setThinFontWith(size: CGFloat) -> Font {
        return Font.custom("Roboto-Thin", size: size)
    }

    static func setRegularFontWith(size: CGFloat) -> Font {
        return Font.custom("Roboto-Regular", size: size)
    }
}
