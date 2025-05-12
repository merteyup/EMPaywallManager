import SwiftUI

public struct PaywallIcon: Hashable {
    public let systemName: String
    public let color: Color

    public init(systemName: String, color: Color = .blue) {
        self.systemName = systemName
        self.color = color
    }

    public static let `default` = PaywallIcon(systemName: "star.fill", color: .blue)
}