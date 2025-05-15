//
//  ModernPaywallViewModel.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 14.05.2025.
//

import Foundation
import SwiftUI

final public class ModernPaywallViewModel: ObservableObject, PaywallViewModelProtocol {
    
    let mainBackground: AnyView?
    public let model: PaywallModel
    public let onSubscribe: ((Feature) -> Void)?
    public let onRestore: (() -> Void)?
    public let onDismiss: (() -> Void)?
    public let onFeatureSelect: ((Feature) -> Void)?
    @Published public var selectedFeature: Feature {
        didSet {
            onFeatureSelect?(selectedFeature)
        }
    }
    
    init(model: PaywallModel,
         mainBackground: AnyView? = nil,
         onSubscribe: ((Feature) -> Void)? = nil,
         onRestore: (() -> Void)? = nil,
         onDismiss: (() -> Void)? = nil,
         onFeatureSelect: ((Feature) -> Void)? = nil) {
        self.model = model
        self.mainBackground = mainBackground
        self.onSubscribe = onSubscribe
        self.onRestore = onRestore
        self.onDismiss = onDismiss
        self.onFeatureSelect = onFeatureSelect
        self.selectedFeature = model.features.first ?? Feature.fallbackWithLogging(reason: "ModernPaywallView: No features available")
    }
}
