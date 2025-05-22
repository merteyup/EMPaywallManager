//
//  SwiftUIView 2.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 8.05.2025.
//

import SwiftUI

enum IconAlignment {
    case left
    case right
}

struct EMIconLabel: View {
    let messages: [String]
    let isAnimated: Bool
    let iconAlignment: IconAlignment
    let icon: PaywallIcon?

    init(
        messages: [String],
        isAnimated: Bool,
        iconAlignment: IconAlignment = .left,
        icon: PaywallIcon? = nil
    ) {
        self.messages = messages
        self.isAnimated = isAnimated
        self.iconAlignment = iconAlignment
        self.icon = icon
    }

    private var iconName: String {
        icon?.name ?? "checkmark.circle.fill"
    }
    
    private var iconColor: Color {
        icon?.color ?? .green
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(messages, id: \.self) { message in
                HStack(alignment: .center, spacing: 8) {
                    if iconAlignment == .left {
                        iconView
                    }
                    
                    Text(message)
                        .font(.callout)
                        .lineLimit(1)
                        .minimumScaleFactor(0.7)
                    
                    if iconAlignment == .right {
                        Spacer()
                        iconView
                    }
                }
            }
        }
        .padding(.vertical, 4)
        .padding(.horizontal, 6)
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var iconView: some View {
        Image(systemName: iconName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(isAnimated ? iconColor : .gray)
            .frame(width: 24, height: 24)
            .animation(.easeInOut(duration: isAnimated ? 0.5 : 0), value: isAnimated)
    }
}


#Preview {
    EMIconLabel(messages: ["String", "String"],
                isAnimated: false)
}
