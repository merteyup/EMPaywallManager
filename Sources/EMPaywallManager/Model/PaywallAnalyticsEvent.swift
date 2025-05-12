//
//  PaywallAnalyticsEvent.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 10.05.2025.
//

import SwiftUI

public struct PaywallAnalyticsEvent {
    public let action: Action
    public let variant: PaywallType
    public let userId: String?
    public let timestamp: Date

    public enum Action: String {
        case shown
        case subscribe
        case restore
        case dismiss
    }

    public init(
        action: Action,
        variant: PaywallType,
        userId: String? = nil,
        timestamp: Date = Date()
    ) {
        self.action = action
        self.variant = variant
        self.userId = userId
        self.timestamp = timestamp
    }
}
