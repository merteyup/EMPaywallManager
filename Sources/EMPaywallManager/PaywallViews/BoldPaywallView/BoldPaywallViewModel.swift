//
//  BoldPaywallViewModel.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 14.05.2025.
//

import Foundation
import SwiftUI

final public class BoldPaywallViewModel: PaywallViewModelProtocol {
    
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
    
    public init(model: PaywallModel,
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
        self.selectedFeature = model.features.first ?? Feature.fallbackWithLogging(reason: "BoldPaywallView: No features available")
        print("⚠️ BoldPaywallViewModel onSubscribe assigned: \(onSubscribe != nil)")
    }
    
    var iconName: String? {
        model.mainIcon?.name
    }
    
    var priceText: String {
        "\(model.features[0].price) after. Cancel anytime."
    }
}
