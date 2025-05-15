//
//  PaywallFactory.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 8.05.2025.
//

import SwiftUI

public enum PaywallType: String, CaseIterable {
    case classic, modern, minimalist, bold, imageHeavy, animationDriven, testimonialBased, gradientStyle, fullScreen, splitLayout
}


public struct PaywallFactory {

    @MainActor
    public static func make(
           model: PaywallModel,
           onSubscribe: ((Feature) -> Void)? = nil,
           onRestore: (() -> Void)? = nil,
           onDismiss: (() -> Void)? = nil
    ) -> AnyView {
        let type = PaywallABManager.shared.assignedType
        let view: any PaywallViewProtocol
        
        switch type {
        case .classic:
            view = ClassicPaywallView(
                viewModel: ClassicPaywallViewModel(
                    model: model,
                    onSubscribe: { _ in },
                    onRestore: { },
                    onDismiss: { }
                )
            )
        case .modern:
            view = ModernPaywallView(
                viewModel: ModernPaywallViewModel(
                    model: model,
                    onSubscribe: { _ in },
                    onRestore: { },
                    onDismiss: { }
                )
            )
        case .minimalist:
            view = MinimalistPaywallView(
                viewModel: MinimalistPaywallViewModel(
                    model: model,
                    onSubscribe: { _ in },
                    onRestore: { },
                    onDismiss: { }
                )
            )
        case .bold:
            view = BoldPaywallView(
                viewModel: BoldPaywallViewModel(
                    model: model,
                    onSubscribe: { _ in },
                    onRestore: { },
                    onDismiss: { }
                )
            )
        default:
            fatalError("\(type.rawValue.capitalized) Paywall is not implemented yet.")
        }
        return AnyView(view)
    }
}
