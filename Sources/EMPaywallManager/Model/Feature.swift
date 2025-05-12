
public struct Feature: Hashable, Sendable {
    public let title: String
    public let description: String
    public let price: String
    
    public init(title: String, description: String = "", price: String) {
        self.title = title
        self.description = description
        self.price = price
    }
    
    public static func == (lhs: Feature, rhs: Feature) -> Bool {
        return lhs.title == rhs.title &&
        lhs.description == rhs.description &&
        lhs.price == rhs.price
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(description)
        hasher.combine(price)
    }
    
    public static let fallback = Feature(
        title: "Premium Access",
        description: "Full access to all premium features",
        price: "$4.99/month"
    )
}

extension Feature {
    static func fallbackWithLogging(reason: String) -> Feature {
        let message = "⚠️ Fallback feature used. Reason: \(reason)"
        print(message)
        // TODO: Example crash logging for important case
        // I can log this in the future.
        //  Crashlytics.crashlytics().log(message)
        return .fallback
    }
}