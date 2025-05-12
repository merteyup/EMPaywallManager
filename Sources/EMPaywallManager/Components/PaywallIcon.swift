//
//  PaywallIcon.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 12.05.2025.
//

import SwiftUI

public struct PaywallIcon: Hashable, Sendable {
    public let name: String
    public let color: Color

    public init(name: String, color: Color = .blue) {
        self.name = name
        self.color = color
    }

    public static let `default` = PaywallIcon(name: "star.fill", color: .blue)
}
