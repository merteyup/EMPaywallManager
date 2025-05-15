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
    @Published public var selectedFeature: Feature
    
    public init(model: PaywallModel,
                mainBackground: AnyView? = nil,
                onSubscribe: ((Feature) -> Void)? = nil,
                onRestore: (() -> Void)? = nil,
                onDismiss: (() -> Void)? = nil) {
        self.model = model
        self.mainBackground = mainBackground
        self.onSubscribe = onSubscribe
        self.onRestore = onRestore
        self.onDismiss = onDismiss
        self.selectedFeature = model.features.first ?? Feature.fallbackWithLogging(reason: "BoldPaywallView: No features available")
    }
    
    var iconName: String? {
        model.mainIcon?.name
    }
    
    var priceText: String {
        "\(model.features[0].price) after. Cancel anytime."
    }
}
