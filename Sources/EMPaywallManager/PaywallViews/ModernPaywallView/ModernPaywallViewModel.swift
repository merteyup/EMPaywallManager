//
//  ModernPaywallViewModel.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 14.05.2025.
//

import Foundation

final public class ModernPaywallViewModel: ObservableObject, PaywallViewModelProtocol {
    @Published public var selectedFeature: Feature

   public let model: PaywallModel
   public let onSubscribe: ((Feature) -> Void)?
   public let onRestore: (() -> Void)?
   public let onDismiss: (() -> Void)?

    init(model: PaywallModel,
         onSubscribe: ((Feature) -> Void)? = nil,
         onRestore: (() -> Void)? = nil,
         onDismiss: (() -> Void)? = nil) {
        self.model = model
        self.onSubscribe = onSubscribe
        self.onRestore = onRestore
        self.onDismiss = onDismiss
        self.selectedFeature = model.features.first ?? Feature.fallbackWithLogging(reason: "ModernPaywallView: No features available")
    }
}
