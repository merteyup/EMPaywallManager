//
//  String+Extension.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 19.05.2025.
//

import SwiftUI

extension String {
    func formattedAsCurrency(locale: Locale = .current) -> String {
        let number = NSDecimalNumber(string: self)
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = locale
        return formatter.string(from: number) ?? self
    }
}
