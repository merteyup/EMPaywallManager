//
//  SwiftUIView.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 11.05.2025.
//

import SwiftUI

public struct MinimalistPaywallView: PaywallViewProtocol {
    private let model: PaywallModel
    private let onSubscribe: (() -> Void)?
    private let onRestore: (() -> Void)?
    private let onDismiss: (() -> Void)?

    public init(
        model: PaywallModel,
        onSubscribe: (() -> Void)? = nil,
        onRestore: (() -> Void)? = nil,
        onDismiss: (() -> Void)? = nil
    ) {
        self.model = model
        self.onSubscribe = onSubscribe
        self.onRestore = onRestore
        self.onDismiss = onDismiss
    }

    public var body: some View {
        VStack(spacing: 24) {
            if let iconName = model.iconName {
                Image(systemName: iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                    .foregroundColor(.primary)
            }

            Text(model.title)
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)

            Text(model.subtitle)
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)

            Text(model.price)
                .font(.headline)
                .padding(.top)

            Button(action: { onSubscribe?() }) {
                Text(model.buttonTitle)
                    .frame(maxWidth: .infinity, minHeight: 44)
                    .background(Color.primary)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

            Button("Restore Purchases", action: { onRestore?() })
                .font(.footnote)
                .foregroundColor(.blue)

            Button("Not now", action: { onDismiss?() })
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .padding()
    }
}

#Preview {
    MinimalistPaywallView(
        model: PaywallModel.mock,
        onSubscribe: { },
        onRestore: { },
        onDismiss: { }
    )
}
