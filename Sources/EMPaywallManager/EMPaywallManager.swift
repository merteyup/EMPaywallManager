//
//  EMPaywallManager.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 15.05.2025.
//

import SwiftUI

@MainActor
public enum EMPaywallManager {
    public static func configure(with variants: [PaywallType] = []) {
        PaywallABManager.shared.configure(variants: variants)
        print("[EMPaywallManager] configured successfully with variants: \(variants.map { $0.rawValue }.joined(separator: " and ")). ✅")
    }
    
    public static func configureVariants(_ variants: [PaywallType]) {
        PaywallABManager.shared.configureVariants(variants)
    }
    
    public static func configureRenderer(_ renderer: @escaping (PaywallType) -> AnyView) {
        PaywallABManager.shared.configureRenderer(renderer)
    }
    
    public static var resolvedView: AnyView {
        PaywallABManager.shared.resolvedView
    }
    
    public static var assignedType: PaywallType {
        PaywallABManager.shared.assignedType
    }
}
