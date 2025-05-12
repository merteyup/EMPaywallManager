//
//  PaywallButton 2.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 12.05.2025.
//


public struct PaywallButtonModel: Hashable {
    public let title: String
    public let backgroundColor: String?
    public let foregroundColor: String?
    public let cornerRadius: CGFloat?

    public init(
        title: String,
        backgroundColor: String? = nil,
        foregroundColor: String? = nil,
        cornerRadius: CGFloat? = nil
    ) {
        self.title = title
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.cornerRadius = cornerRadius
    }
}
