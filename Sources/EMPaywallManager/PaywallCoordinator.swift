//
//  PaywallCoordinator.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 10.05.2025.
//

import SwiftUI

public final class PaywallCoordinator: ObservableObject {
    @Published public var isPresented: Bool = false
    private let onSubscribe: ((Feature) -> Void)?
    private let onRestore: (() -> Void)?
    private let onDismiss: (() -> Void)?
    private let logger: PaywallAnalyticsLogger?
    public let variant: PaywallType
    private let userId: String?
    private let model: PaywallModel

    public init(
        model: PaywallModel,
        variant: PaywallType,
        userId: String? = nil,
        logger: PaywallAnalyticsLogger? = nil,
        onSubscribe: ((Feature) -> Void)? = nil,
        onRestore: (() -> Void)? = nil,
        onDismiss: (() -> Void)? = nil
    ) {
        self.model = model
        self.variant = variant
        self.userId = userId
        self.logger = logger
        self.onSubscribe = onSubscribe
        self.onRestore = onRestore
        self.onDismiss = onDismiss
    }

    private func log(
        _ action: PaywallAnalyticsEvent.Action
    ) {
        logger?.log(
            event: .init(
                action: action,
                variant: variant,
                userId: userId
            )
        )
    }

    private func handleSubscribe(selectedFeature: Feature) {
        log(.subscribe)
        onSubscribe?(selectedFeature)
        isPresented = false
    }

    private func handleRestore() {
        log(.restore)
        onRestore?()
        isPresented = false
    }

    private func handleDismiss() {
        log(.dismiss)
        onDismiss?()
        isPresented = false
    }

    @MainActor @ViewBuilder
    public func view() -> some View {
        PaywallFactory.make(
            model: model,
            onSubscribe: handleSubscribe,
            onRestore: handleRestore,
            onDismiss: handleDismiss
        )
        .onAppear {
            self.log(.shown)
        }
    }
}

