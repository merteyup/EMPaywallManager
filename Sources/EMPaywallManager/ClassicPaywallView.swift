//
//  SwiftUIView.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 8.05.2025.
//

import SwiftUI

public struct PaywallView: View {
    
    public let model: PaywallModel
    public var onSubscribe: (() -> Void)?
    public var onRestore: (() -> Void)?
    public var onDismiss: (() -> Void)?
    
    public init(model: PaywallModel,
                onSubscribe: (() -> Void)? = nil,
                onRestore: (() -> Void)? = nil,
                onDismiss: (() -> Void)? = nil) {
        self.model = model
        self.onSubscribe = onSubscribe
        self.onRestore = onRestore
        self.onDismiss = onDismiss
    }

    
    
    public var body: some View {
        VStack(spacing: 16) {
            
            DismissButton(onDismiss: onDismiss)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 16)
            
            Spacer()
            
            PaywallContentView(model: model)
            
            Spacer()
            
            PaywallFooterView(model: model,
                              onSubscribe: onSubscribe,
                              onRestore: onRestore,
                              onDismiss: onDismiss)
        }
        .padding()
    }
}

#Preview {
    PaywallView(
        model: PaywallModel.mock,
        onSubscribe: { },
        onRestore: { },
        onDismiss: { }
    )
}
