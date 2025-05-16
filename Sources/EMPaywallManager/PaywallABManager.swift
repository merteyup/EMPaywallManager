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
    private var renderer: ((PaywallType) -> AnyView)?
    
    public static let shared = PaywallABManager()
    
    private init() {}
    
    public func configure(variants: [PaywallType]) {
        precondition(variants.count >= 2, "At least two variants are required for A/B testing.")
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
    
    public func configureRenderer(_ renderer: @escaping (PaywallType) -> AnyView) {
        self.renderer = renderer
    }
    
    public func configureVariants(_ variants: [PaywallType]) {
        configure(variants: variants)
    }
    
    public var resolvedView: AnyView {
        guard let renderer = renderer else {
            fatalError("Paywall renderer not configured. Call configureRenderer(...) before showing a paywall.")
        }
        return renderer(assignedType)
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
