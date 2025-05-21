//
//  SimplePaywallModel.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 16.05.2025.
//

import SwiftUI

public struct SimplePaywallModel {
    public let icon: String
    public let title: String
    public let subtitle: String
    public let feature: Feature
    public let paywallButton: PaywallButtonModel?

    public init(
        icon: String = "star.fill",
        title: String = "Become a Premium",
        subtitle: String = "Access all premium features",
        feature: Feature,
        paywallButton: PaywallButtonModel? = nil
    ) {
        self.icon = icon
        self.title = title
        self.subtitle = subtitle
        self.feature = feature
        self.paywallButton = paywallButton
    }
}

public extension SimplePaywallModel {
    func toPaywallModel() -> PaywallModel {
        PaywallModel(
            mainIcon: PaywallIcon(name: icon),
            title: title,
            subtitle: subtitle,
            features: [feature],
            dismissButton: DismissButtonModel(),
            paywallButton: paywallButton
        )
    }
}
