//
//  PaywallButton.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 8.05.2025.
//

import SwiftUI

public struct PaywallButton: View {
    let model: PaywallButtonModel
    let action: () -> Void
    
    public init(with model: PaywallButtonModel,
                action: @escaping () -> Void) {
        self.model = model
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            Text(model.title)
                .font(.headline)
                .foregroundColor(model.foregroundColor)
                .frame(maxWidth: .infinity,
                       minHeight: 50)
                .background(model.backgroundColor)
                .clipShape(
                    RoundedRectangle(cornerRadius: model.cornerRadius ?? 25, style: .continuous)
                )
        }
        .padding()
        .clipShape(.capsule)
    }
}

#Preview {
    PaywallButton(with: PaywallButtonModel(title: "Subscribe")) {
        print("Subscription tapped")
    }
}
    
