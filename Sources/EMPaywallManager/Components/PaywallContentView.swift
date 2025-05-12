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
                HStack {
                    EMIconLabel(messages: model.featureMessages,
                                isAnimated: true,
                                icon: model.featureIcon)
                }
            }
            .padding()
            
            Text(model.features.first?.price ?? "")
                .font(.title2)
                .bold()
        }
    }
}


struct IconWithTitleView: View {
    let model: PaywallModel
    
    var body: some View {
        VStack(spacing: 16) {
            if let mainIconName = model.mainIcon?.name {
                Image(systemName: mainIconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .foregroundColor(model.mainIcon?.color ?? .primary)
            }
            
            Text(model.title)
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
            
            Text(model.subtitle)
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    PaywallContentView(model: PaywallModel.mockClassic)
}
