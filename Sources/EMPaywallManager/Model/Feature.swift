//
//  Feature.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 12.05.2025.
//

public struct Feature: Hashable, Sendable, Identifiable {
    public let id: String
    public let title: String
    public let descriptions: [String]
    public let price: String
    public let iconName: String?
    
    public init(
        id: String,
        title: String,
        descriptions: [String] = [],
        price: String,
        iconName: String? = nil
    ) {
        self.id = id
        self.title = title
        self.descriptions = descriptions
        self.price = price
        self.iconName = iconName
    }
    
    public static func == (lhs: Feature, rhs: Feature) -> Bool {
        return
        lhs.id == rhs.id &&
        lhs.title == rhs.title &&
        lhs.descriptions == rhs.descriptions &&
        lhs.price == rhs.price &&
        lhs.iconName == rhs.iconName
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(descriptions)
        hasher.combine(price)
        hasher.combine(iconName)
    }
    
    public static let fallback = Feature(
        id: "1234_fallbackProduct",
        title: "Premium Access",
        descriptions: ["Full access to all premium features"],
        price: "$4.99/month"
    )
    
    public static let mock = Feature(
        id: "1234_mockProduct",
        title: "Premium Access",
        descriptions: ["Full access to all premium features"],
        price: "$4.99/month"
    )
    
    public static let defaultDescriptions = ["Full access to all premium features",
                                             "No ads",
                                             "No interruptions",
                                             "No limitations"]
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
