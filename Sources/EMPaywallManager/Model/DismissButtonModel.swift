//
//  PaywallButtonModel 2.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 15.05.2025.
//


import SwiftUI

public struct DismissButtonModel: Hashable {
    public let iconName: String = "xmark"
    public let backgroundColor: Color?
    public let foregroundColor: Color?
    public let cornerRadius: CGFloat?

    public init(
        backgroundColor: Color? = nil,
        foregroundColor: Color? = .white,
        cornerRadius: CGFloat? = nil
    ) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.cornerRadius = cornerRadius
    }
}
