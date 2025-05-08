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
    var iconAlignment: IconAlignment = .left
    var iconImage: String = "checkmark.circle.fill"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if messages.isEmpty {
                Text("Kampanyasız görünüm için iyileştirmeye açıktır.")
                    .foregroundColor(.secondary)
                    .italic()
            } else {
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
        }
        .padding(.vertical, 4)
        .padding(.horizontal, 6)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var iconView: some View {
        ZStack {
            Image(systemName: iconImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(isAnimated ? .green : .gray)
                .font(.system(size: 24, weight: .bold))
                .frame(width: 24, height: 24)
        }
        .animation(.easeInOut(duration: isAnimated ? 0.5 : 0), value: isAnimated)
    }
}


#Preview {
    EMIconLabel(messages: ["String", "String"],
                isAnimated: false)
}
