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
    public let dismissButton: DismissButtonModel
    public let paywallButton: PaywallButtonModel
    public let legalTextArea: LegalTextArea?
    
    public init(
        mainIcon: PaywallIcon? = nil,
        title: String,
        subtitle: String,
        features: [Feature],
        featureIcon: PaywallIcon? = nil,
        dismissButton: DismissButtonModel,
        paywallButton: PaywallButtonModel,
        legalTextArea: LegalTextArea? = nil
    ) {
        self.mainIcon = mainIcon
        self.title = title
        self.subtitle = subtitle
        self.features = features
        self.featureIcon = featureIcon
        self.dismissButton = dismissButton
        self.paywallButton = paywallButton
        self.legalTextArea = legalTextArea
    }
    
    public var featureMessages: [String] {
        features.map { feature in
            let descriptionPart = feature.descriptions.isEmpty ? "" : " - \(feature.descriptions)"
            return "\(feature.title)\(descriptionPart)"
        }
    }
    
    public static func == (lhs: PaywallModel, rhs: PaywallModel) -> Bool {
        return lhs.mainIcon == rhs.mainIcon &&
        lhs.title == rhs.title &&
        lhs.subtitle == rhs.subtitle &&
        lhs.features == rhs.features &&
        lhs.featureIcon == rhs.featureIcon &&
        lhs.dismissButton == rhs.dismissButton &&
        lhs.paywallButton == rhs.paywallButton &&
        lhs.legalTextArea == rhs.legalTextArea
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(mainIcon)
        hasher.combine(title)
        hasher.combine(subtitle)
        hasher.combine(features)
        hasher.combine(featureIcon)
        hasher.combine(dismissButton)
        hasher.combine(paywallButton)
        hasher.combine(legalTextArea)
    }
}

@MainActor
public extension PaywallModel {
    
    static var mockLegalText = "By clicking \"Try Now\" you agree to our Terms of Use and Privacy Policy. We do not sell or share your personal data. You can turn off auto renewal at any time. Check Promotion Terms and Conditions."
    static var mockLegalTerms = (title: "Terms of Use", url: "https://example.com/terms")
    static var mockLegalPrivacy = (title: "Privacy Policy", url: "https://example.com/privacy")
    static var mockLegalConditions = (title: "Promotion Terms and Conditions.", url: "https://example.com/license")
    
    static var mockClassic: PaywallModel {
        PaywallModel(
            mainIcon: PaywallIcon(name: "lock", color: .blue),
            title: "Unlock Premium",
            subtitle: "Access all features and enjoy the full experience",
            features: [
                Feature(
                    id: "1_product_id",
                    title: "Daily Journal Prompts",
                    descriptions: ["Get daily prompts for your journal"],
                    price: "$2.00/month"
                )
            ],
            dismissButton: DismissButtonModel(iconName: .xmark, backgroundColor: .blue, foregroundColor: .white),
            paywallButton: PaywallButtonModel(title: "Get Premium"),
            legalTextArea: LegalTextArea(
                legalText: mockLegalText,
                legalLinks: [
                    .init(
                        title: mockLegalTerms.title,
                        url: mockLegalTerms.url
                    ),
                    .init(
                        title: mockLegalPrivacy.title,
                        url: mockLegalPrivacy.url
                    ),
                    .init(
                        title: mockLegalConditions.title,
                        url:  mockLegalConditions.url
                    )]
            )
        )
    }
    
    static var mockModern: PaywallModel {
        PaywallModel(
            mainIcon: PaywallIcon(name: "pencil", color: .purple),
            title: "Unlock Premium",
            subtitle: "Access all features and enjoy the full experience",
            features: [
                Feature(
                    id: "1_product_id",
                    title: "Daily Journal Prompts",
                    descriptions: ["Get daily prompts for your journal"],
                    price: "$2.00/month",
                    iconName: "checkmark"
                ),
                Feature(
                    id: "2_product_id",
                    title: "AI Suggestions",
                    descriptions: ["Smart suggestions powered by AI"],
                    price: "$1.50/month"
                ),
                Feature(
                    id: "3_product_id",
                    title: "OpenAI Support",
                    descriptions: ["Get advices from chatGPT"],
                    price: "$0.90/month"
                ),
                Feature(
                    id: "4_product_id",
                    title: "Colorful themes",
                    descriptions: ["Add some color into your project"],
                    price: "$1.00/month"
                ),
                Feature(
                    id: "5_product_id",
                    title: "Auto Readme generator",
                    descriptions: ["Easy to develop, easy to document"],
                    price: "$1.00/month"
                ),
                Feature(
                    id: "6_product_id",
                    title: "Live chat module",
                    descriptions: ["When you need, real help is just a tap away"],
                    price: "$1.00/month"
                ),
                Feature(
                    id: "7_product_id",
                    title: "Add your friends",
                    descriptions: ["If you want, you can sync your friends"],
                    price: "$1.00/month"
                ),
            ],
            featureIcon: PaywallIcon(name: "checkmark", color: .purple),
            dismissButton: DismissButtonModel(backgroundColor: .purple),
            paywallButton: PaywallButtonModel(title: "Start Free Trial", backgroundColor: .purple, cornerRadius: 12),
            legalTextArea: LegalTextArea(
                legalText: mockLegalText,
                legalLinks: [
                    .init(
                        title: mockLegalTerms.title,
                        url: mockLegalTerms.url
                    ),
                    .init(
                        title: mockLegalPrivacy.title,
                        url: mockLegalPrivacy.url
                    ),
                    .init(
                        title: mockLegalConditions.title,
                        url:  mockLegalConditions.url
                    )]
            )
        )
    }
    
    static var mockMinimal: PaywallModel {
        PaywallModel(
            mainIcon: PaywallIcon(name: "circle", color: .blue),
            title: "Get Premium",
            subtitle: "Get the Premium that's right for you",
            features: [
                Feature(
                    id: "1_product_id",
                    title: "Daily Journal Prompts",
                    descriptions: ["Get daily prompts for your journal", "It's an amazing feature so needed one more line", "And even one more"],
                    price: "$6.00/month"
                ),
                Feature(
                    id: "2_product_id",
                    title: "AI Suggestions",
                    descriptions: ["Smart suggestions powered by AI"],
                    price: "$1.50/month"
                ),
                Feature(
                    id: "3_product_id",
                    title: "Multi-device Sync",
                    descriptions: ["Sync your data across multiple devices"],
                    price: "$1.00/month"
                )
            ],
            dismissButton: DismissButtonModel(iconName: .xmark, foregroundColor: .blue),
            paywallButton: PaywallButtonModel(title: "Confirm"),
            legalTextArea: LegalTextArea(
                legalText: mockLegalText,
                legalLinks: [
                    .init(
                        title: mockLegalTerms.title,
                        url: mockLegalTerms.url
                    ),
                    .init(
                        title: mockLegalPrivacy.title,
                        url: mockLegalPrivacy.url
                    ),
                    .init(
                        title: mockLegalConditions.title,
                        url:  mockLegalConditions.url
                    )]
            )
        )
    }
    
    static var mockBold: PaywallModel {
        PaywallModel(
            mainIcon: PaywallIcon(name: "music.note.tv", color: .blue),
            title: "1 Month Free Trial",
            subtitle: "Unlimited Access to 100 Million Songs",
            features: [
                Feature(
                    id: "1_product_id",
                    title: "Unlimited Access to 100 Million Songs",
                    descriptions: ["There's nothing between you and your favorite music"],
                    price: "12.99/month"
                ),
            ],
            dismissButton: DismissButtonModel(backgroundColor: .clear),
            paywallButton: PaywallButtonModel(title: "Try now", backgroundColor: .yellow, foregroundColor: .black, cornerRadius: 8),
            legalTextArea: LegalTextArea(
                legalText: mockLegalText,
                legalLinks: [
                    .init(
                        title: mockLegalTerms.title,
                        url: mockLegalTerms.url
                    ),
                    .init(
                        title: mockLegalPrivacy.title,
                        url: mockLegalPrivacy.url
                    ),
                    .init(
                        title: mockLegalConditions.title,
                        url:  mockLegalConditions.url
                    )]
            )
        )
    }
}
