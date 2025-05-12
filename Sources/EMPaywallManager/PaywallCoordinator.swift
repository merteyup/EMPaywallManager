import SwiftUI

public final class PaywallCoordinator: ObservableObject {
    @Published public var isPresented: Bool = false
    public var onSubscribe: (() -> Void)?
    public var onRestore: (() -> Void)?
    public var onDismiss: (() -> Void)?

    private let model: PaywallModel

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

    @ViewBuilder
    public func view() -> some View {
        PaywallFactory.make(
            model: model,
            onSubscribe: {
                self.onSubscribe?()
                self.isPresented = false
            },
            onRestore: {
                self.onRestore?()
                self.isPresented = false
            },
            onDismiss: {
                self.onDismiss?()
                self.isPresented = false
            }
        )
    }
}
