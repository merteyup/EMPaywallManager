
public protocol PaywallViewProtocol: View {
    var onSubscribe: (() -> Void)? { get set }
    var onRestore: (() -> Void)? { get set }
    var onDismiss: (() -> Void)? { get set }
}