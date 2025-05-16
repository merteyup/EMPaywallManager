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
    public let buttonTitle: String

    public init(
        icon: String = "star.fill",
        title: String = "Upgrade to Pro",
        subtitle: String = "Access all premium features",
        feature: Feature,
        buttonTitle: String = "Continue"
    ) {
        self.icon = icon
        self.title = title
        self.subtitle = subtitle
        self.feature = feature
        self.buttonTitle = buttonTitle
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
            paywallButton: PaywallButtonModel(title: buttonTitle)
        )
    }
}
