//
//  PaywallButtonModel 2.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 15.05.2025.
//


import SwiftUI

public struct DismissButtonModel: Hashable {
    public enum IconName: String {
        case xmark = "xmark"
        case xmarkCircle = "xmark.circle"
        case xmarkCircleFill = "xmark.circle.fill"
        case xmarkSquare = "xmark.square"
        case xmarkSquareFill = "xmark.square.fill"
        case xmarkRectangle = "xmark.rectangle"
        case xmarkRectangleFill = "xmark.rectangle.fill"
        case xmarkDiamond = "xmark.diamond"
        case xmarkDiamondFill = "xmark.diamond.fill"
        case xmarkOctagon = "xmark.octagon"
        case xmarkOctagonFill = "xmark.octagon.fill"
    }
    
    public let iconName: String
    public let alignment: Alignment
    public let backgroundColor: Color?
    public let foregroundColor: Color?
    public let cornerRadius: CGFloat?
    
    public init(
        iconName: IconName = .xmark,
        alignment: Alignment = .trailing,
        backgroundColor: Color? = .white,
        foregroundColor: Color? = .black,
        cornerRadius: CGFloat? = nil
    ) {
        self.iconName = iconName.rawValue
        self.alignment = alignment
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.cornerRadius = cornerRadius
    }
    
    public static func == (lhs: DismissButtonModel, rhs: DismissButtonModel) -> Bool {
        return lhs.iconName == rhs.iconName &&
        lhs.backgroundColor == rhs.backgroundColor &&
        lhs.foregroundColor == rhs.foregroundColor &&
        lhs.cornerRadius == rhs.cornerRadius
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(iconName)
        hasher.combine(backgroundColor)
        hasher.combine(foregroundColor)
        hasher.combine(cornerRadius)
    }
}
