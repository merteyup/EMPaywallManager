//
//  PaywallABManager.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 8.05.2025.
//

import SwiftUI

@MainActor
public final class PaywallABManager {
    private let key = "selectedPaywallType"
    private var availableVariants: [PaywallType] = []

    public static let shared = PaywallABManager()

    private init() {}

    public func configure(variants: [PaywallType]) {
        precondition(variants.count == 2, "Exactly two variants are required for A/B testing.")
        availableVariants = variants

#if DEBUG
        UserDefaults.standard.removeObject(forKey: key)
#endif

        if UserDefaults.standard.string(forKey: key) == nil,
           let selected = variants.randomElement() {
            UserDefaults.standard.set(selected.rawValue, forKey: key)
            debugPrint("✅ Paywall variant assigned: \(selected.rawValue)")
        }
    }

    public var assignedType: PaywallType {
        guard
            let rawValue = UserDefaults.standard.string(forKey: key),
            let type = PaywallType(rawValue: rawValue)
        else {
            fatalError("""
            ⚠️ PaywallABManager not configured.
            Make sure to call `PaywallABManager.shared.configure(...)` early in your App lifecycle (e.g., in App.init).
            """)
        }
        return type
    }
}
