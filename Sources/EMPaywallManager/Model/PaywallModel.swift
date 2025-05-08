//
//  File.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 8.05.2025.
//

import Foundation

public struct PaywallModel {
    public let iconName: String?
    public let title: String
    public let subtitle: String
    public let features: [String]
    public let price: String
    public let buttonTitle: String
    public let legalLinks: [LegalLink]?

    public init(
        iconName: String? = nil,
        title: String,
        subtitle: String,
        features: [String],
        price: String,
        buttonTitle: String,
        legalLinks: [LegalLink]? = nil
    ) {
        self.iconName = iconName
        self.title = title
        self.subtitle = subtitle
        self.features = features
        self.price = price
        self.buttonTitle = buttonTitle
        self.legalLinks = legalLinks
    }
}

public extension PaywallModel {
    static var mock: PaywallModel {
        PaywallModel(
            iconName: "star.fill",
            title: "Unlock Premium",
            subtitle: "Access all features and enjoy the full experience",
            features: [
                "Daily Journal Prompts",
                "AI Suggestions",
                "Multi-device Sync"
            ],
            price: "$4.99/month",
            buttonTitle: "Start Free Trial",
            legalLinks: [
                .init(title: "Terms", url: URL(string: "https://example.com/terms")!),
                .init(title: "Privacy", url: URL(string: "https://example.com/privacy")!),
                .init(title: "License", url: URL(string: "https://example.com/license")!)
            ]
        )
    }
}


