//
//  PaywallAnalyticsLogger.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 10.05.2025.
//

public protocol PaywallAnalyticsLogger {
    func log(event: PaywallAnalyticsEvent)
}
