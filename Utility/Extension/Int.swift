//
//  Int.swift
//  CineVerse
//
//  Created by Admin on 03/09/26.
//
import Foundation

extension Int {
    
    var formattedRuntime: String {
        guard self > 0 else { return "N/A" }

        let hours = self / 60
        let minutes = self % 60

        if hours > 0 && minutes > 0 {
            return "\(hours)h \(minutes)m"
        } else if hours > 0 {
            return "\(hours)h"
        } else {
            return "\(minutes)m"
        }
    }

    var formattedWithCommas: String {
        self.formatted(.number.grouping(.automatic))
    }
}

extension Int64 {

    var formattedWithCommas: String {
        self.formatted(.number.grouping(.automatic))
    }

    var formattedAsCurrency: String {
        self.formatted(.currency(code: "USD").precision(.fractionLength(0)))
    }
}
