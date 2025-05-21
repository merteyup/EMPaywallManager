//
//  PaywallButtonModel.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 12.05.2025.
//

import SwiftUI

public struct PaywallButtonModel: Hashable {
    public let title: String
    public let backgroundColor: Color?
    public let foregroundColor: Color?
    public let cornerRadius: CGFloat?

    public init(
        title: String,
        backgroundColor: Color? = .blue,
        foregroundColor: Color? = .white,
        cornerRadius: CGFloat? = nil
    ) {
        self.title = title
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.cornerRadius = cornerRadius
    }
}
