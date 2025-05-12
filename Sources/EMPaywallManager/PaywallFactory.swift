public struct PaywallFactory {
    public static func make(
        type: PaywallType,
        model: PaywallModel,
        onSubscribe: (() -> Void)? = nil,
        onRestore: (() -> Void)? = nil,
        onDismiss: (() -> Void)? = nil
    ) -> some PaywallViewProtocol {
        switch type {
        case .classic:
            return PaywallView(
                model: model,
                onSubscribe: onSubscribe,
                onRestore: onRestore,
                onDismiss: onDismiss
            )
        case .modern:
            return ModernPaywallView( // this is your second design
                model: model,
                onSubscribe: onSubscribe,
                onRestore: onRestore,
                onDismiss: onDismiss
            )
        }
    }
}
