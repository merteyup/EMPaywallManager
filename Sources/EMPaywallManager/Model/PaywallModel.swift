//
//  File.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 8.05.2025.
//

import Foundation

public struct PaywallModel: Hashable {
    
    public let mainIcon: PaywallIcon?
    public let title: String
    public let subtitle: String
    public let features: [Feature]
    public let featureIcon: PaywallIcon?
    public let paywallButton: PaywallButtonModel
    public let legalLinks: [LegalLink]?
    
    public init(
        mainIcon: PaywallIcon? = nil,
        title: String,
        subtitle: String,
        features: [Feature],
        featureIcon: PaywallIcon? = nil,
        price: String,
        paywallButton: PaywallButtonModel,
        legalLinks: [LegalLink]? = nil
    ) {
        self.mainIcon = mainIcon
        self.title = title
        self.subtitle = subtitle
        self.features = features
        self.featureIcon = featureIcon
        self.paywallButton = paywallButton
        self.legalLinks = legalLinks
    }
    
    public var featureMessages: [String] {
        features.map { feature in
            let descriptionPart = feature.description.isEmpty ? "" : " - \(feature.description)"
            return "\(feature.title)\(descriptionPart)"
        }
    }
    
    public static func == (lhs: PaywallModel, rhs: PaywallModel) -> Bool {
        return lhs.mainIcon == rhs.mainIcon &&
        lhs.title == rhs.title &&
        lhs.subtitle == rhs.subtitle &&
        lhs.features == rhs.features &&
        lhs.featureIcon == rhs.featureIcon &&
        lhs.paywallButton == rhs.paywallButton &&
        lhs.legalLinks == rhs.legalLinks
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(mainIcon)
        hasher.combine(title)
        hasher.combine(subtitle)
        hasher.combine(features)
        hasher.combine(featureIcon)
        hasher.combine(paywallButton)
        hasher.combine(legalLinks)
    }
}

@MainActor
public extension PaywallModel {
    static var mockClassic: PaywallModel {
        PaywallModel(
            mainIcon: PaywallIcon(name: "lock", color: .blue),
            title: "Unlock Premium",
            subtitle: "Access all features and enjoy the full experience",
            features: [
                Feature(title: "Daily Journal Prompts", description: "Get daily prompts for your journal", price: "$2.00/month"),
                Feature(title: "AI Suggestions", description: "Smart suggestions powered by AI", price: "$1.50/month"),
                Feature(title: "Multi-device Sync", description: "Sync your data across multiple devices", price: "$1.00/month")
            ],
            price: "$4.99/month",
            paywallButton: PaywallButtonModel(title: "Get Premium", backgroundColor: .blue, foregroundColor: .white),
            legalLinks: [
                .init(title: "Terms", url: URL(string: "https://example.com/terms")!),
                .init(title: "Privacy", url: URL(string: "https://example.com/privacy")!),
                .init(title: "License", url: URL(string: "https://example.com/license")!)
            ]
        )
    }
    
    static var mockModern: PaywallModel {
        PaywallModel(
            mainIcon: PaywallIcon(name: "pencil", color: .purple),
            title: "Unlock Premium",
            subtitle: "Access all features and enjoy the full experience",
            features: [
                Feature(title: "Daily Journal Prompts", description: "Get daily prompts for your journal", price: "$2.00/month", iconName: "checkmark"),
                Feature(title: "AI Suggestions", description: "Smart suggestions powered by AI", price: "$1.50/month"),
                Feature(title: "OpenAI Support", description: "Get advices from chatGPT", price: "$0.90/month"),
                Feature(title: "Colorful themes", description: "Add some color into your project", price: "$1.00/month"),
                Feature(title: "Auto Readme generator", description: "Easy to develop, easy to document", price: "$1.00/month"),
                Feature(title: "Live chat module", description: "When you need, real help is just a tap away", price: "$1.00/month"),
                Feature(title: "Add your friends", description: "If you want, you can sync your friends", price: "$1.00/month"),
            ],
            featureIcon: PaywallIcon(name: "checkmark", color: .purple),
            price: "$4.99/month",
            paywallButton: PaywallButtonModel(title: "Start Free Trial", backgroundColor: .purple, foregroundColor: .white, cornerRadius: 12),
            legalLinks: [
                .init(title: "Terms", url: URL(string: "https://example.com/terms")!),
                .init(title: "Privacy", url: URL(string: "https://example.com/privacy")!),
                .init(title: "License", url: URL(string: "https://example.com/license")!)
            ]
        )
    }
    
    static var mockMinimal: PaywallModel {
        PaywallModel(
            mainIcon: PaywallIcon(name: "circle", color: .blue),
            title: "Get Premium",
            subtitle: "Get the Premium that's right for you",
            features: [
                Feature(title: "Daily Journal Prompts", description: "Get daily prompts for your journal", price: "$2.00/month"),
                Feature(title: "AI Suggestions", description: "Smart suggestions powered by AI", price: "$1.50/month"),
                Feature(title: "Multi-device Sync", description: "Sync your data across multiple devices", price: "$1.00/month")
            ],
            price: "$4.99/month",
            paywallButton: PaywallButtonModel(title: "Confirm", backgroundColor: .blue, foregroundColor: .white),
            legalLinks: [
                .init(title: "Terms", url: URL(string: "https://example.com/terms")!),
                .init(title: "Privacy", url: URL(string: "https://example.com/privacy")!),
                .init(title: "License", url: URL(string: "https://example.com/license")!)
            ]
        )
    }
}
