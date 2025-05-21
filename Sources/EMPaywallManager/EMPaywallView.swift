//
//  EMPaywallView.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 8.05.2025.
//

import SwiftUI

public enum PaywallType: String, CaseIterable {
    case classic, modern, minimalist, bold
    
    // TODO: Will be implemented.
    //imageHeavy, animationDriven, testimonialBased, gradientStyle, fullScreen, splitLayout
}

public struct EMPaywallView: View {
    let model: PaywallModel
    let variant: PaywallType
    let onSubscribe: ((Feature) -> Void)?
    let onRestore: (() -> Void)?
    let onDismiss: (() -> Void)?
    let onFeatureSelect: ((Feature) -> Void)?

    public init(
        model: PaywallModel,
        variant: PaywallType,
        onSubscribe: ((Feature) -> Void)? = nil,
        onRestore: (() -> Void)? = nil,
        onDismiss: (() -> Void)? = nil,
        onFeatureSelect: ((Feature) -> Void)? = nil
    ) {
        self.model = model
        self.variant = variant
        self.onSubscribe = onSubscribe
        self.onRestore = onRestore
        self.onDismiss = onDismiss
        self.onFeatureSelect = onFeatureSelect
    }

    public var body: some View {
        switch variant {
        case .bold:
            BoldPaywallView(viewModel: BoldPaywallViewModel(
                model: model,
                onSubscribe: onSubscribe,
                onRestore: onRestore,
                onDismiss: onDismiss,
                onFeatureSelect: onFeatureSelect
            ))

        case .classic:
            ClassicPaywallView(viewModel: ClassicPaywallViewModel(
                model: model,
                onSubscribe: onSubscribe,
                onRestore: onRestore,
                onDismiss: onDismiss,
                onFeatureSelect: onFeatureSelect
            ))

        case .minimalist:
            MinimalistPaywallView(viewModel: MinimalistPaywallViewModel(
                model: model,
                onSubscribe: onSubscribe,
                onRestore: onRestore,
                onDismiss: onDismiss,
                onFeatureSelect: onFeatureSelect
            ))

        case .modern:
            ModernPaywallView(viewModel: ModernPaywallViewModel(
                model: model,
                onSubscribe: onSubscribe,
                onRestore: onRestore,
                onDismiss: onDismiss,
                onFeatureSelect: onFeatureSelect
            ))

        default:
            fatalError("Paywall type \(variant.rawValue) not implemented.")
        }
    }
}

public extension EMPaywallView {
    static func withAssignedVariant(
        using model: PaywallModel,
        onSubscribe: ((Feature) -> Void)? = nil,
        onRestore: (() -> Void)? = nil,
        onDismiss: (() -> Void)? = nil,
        onFeatureSelect: ((Feature) -> Void)? = nil
    ) -> some View {
        EMPaywallView(
            model: model,
            variant: PaywallABManager.shared.assignedType,
            onSubscribe: onSubscribe,
            onRestore: onRestore,
            onDismiss: onDismiss,
            onFeatureSelect: onFeatureSelect
        )
    }
}
