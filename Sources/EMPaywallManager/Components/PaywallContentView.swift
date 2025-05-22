//
//  PaywallContentView.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 8.05.2025.
//

import SwiftUI

struct PaywallContentView: View {
    let model: PaywallModel

    var body: some View {
        VStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                if let descriptions = model.features.first?.descriptions {
                    EMIconLabel(messages: descriptions,
                                isAnimated: true,
                                icon: model.featureIcon)
                }
            }
            .padding()
            
            
            Text(model.subtitle)
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)

            Text(model.features.first?.price.formattedAsCurrency() ?? "")
                .font(.largeTitle)
                .bold()
        }
    }
}

#Preview {
    PaywallContentView(model: PaywallModel.mockClassic)
}
