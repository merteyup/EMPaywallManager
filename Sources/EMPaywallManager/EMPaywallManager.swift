//
//  EMPaywallManager.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 15.05.2025.
//


public enum EMPaywallManager {
    @MainActor public static func configure(with variants: [PaywallType] = []) {
        PaywallABManager.shared.configure(variants: variants)
        print("[EMPaywallManager] configured successfully with variants: \(variants.map { $0.rawValue }.joined(separator: " and ")). ✅")
    }
}
