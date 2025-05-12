// Step 1: Define the event model

/// Represents an analytics event related to paywall usage.
public struct PaywallAnalyticsEvent {
    /// What kind of action user performed.
    public enum Action: String {
        case shown
        case subscribe
        case restore
        case dismiss
    }

    public let action: Action
    public let variant: PaywallType
    public let userId: String?
    public let timestamp: Date

    public init(action: Action, variant: PaywallType, userId: String? = nil, timestamp: Date = Date()) {
        self.action = action
        self.variant = variant
        self.userId = userId
        self.timestamp = timestamp
    }
}
