//
//  SwiftUIView.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 8.05.2025.
//

import SwiftUI

public struct ClassicPaywallView: PaywallViewProtocol {
    
    public let model: PaywallModel
    public var onSubscribe: ((Feature) -> Void)?
    public var onRestore: (() -> Void)?
    public var onDismiss: (() -> Void)?
    @State private var selectedFeature: Feature
    
    public init(model: PaywallModel,
                onSubscribe: ((Feature) -> Void)? = nil,
                onRestore: (() -> Void)? = nil,
                onDismiss: (() -> Void)? = nil) {
        self.model = model
        self.onSubscribe = onSubscribe
        self.onRestore = onRestore
        self.onDismiss = onDismiss
        _selectedFeature = State(initialValue: model.features.first ?? Feature.fallbackWithLogging(reason: "ClassicPaywallView: No features available"))
    }
    
    public var body: some View {
        VStack(spacing: 16) {
            
            DismissButton(alignment: .leading, onDismiss: onDismiss)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 16)
            
            Spacer()
            
            IconWithTitleView(model: model)
            
            PaywallContentView(model: model)
            
            Spacer()
            
            PaywallFooterView(model: model,
                              onSubscribe: onSubscribe,
                              onRestore: onRestore,
                              onDismiss: onDismiss,
                              selectedFeature: $selectedFeature)
        }
        .padding()
    }
}

#Preview {
    ClassicPaywallView(
        model: PaywallModel.mockClassic,
        onSubscribe: { _ in },
        onRestore: { },
        onDismiss: { }
    )
}
