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
#if DEBUG
UserDefaults.standard.removeObject(forKey: key)
#endif
        precondition(variants.count == 2, "Exactly two variants are required for A/B testing.")
        availableVariants = variants

        if UserDefaults.standard.string(forKey: key) == nil {
            let random = variants.randomElement()!
            UserDefaults.standard.set(random.rawValue, forKey: key)
            print("✅ Assigned variant: \(random.rawValue)")
        }
    }

    public var assignedType: PaywallType {
        guard let raw = UserDefaults.standard.string(forKey: key),
              let type = PaywallType(rawValue: raw) else {
            fatalError("PaywallABManager not configured. Call configure() before using.")
        }
        print("Assigned PaywallType is: \(type.rawValue)")
        return type
    }
}
