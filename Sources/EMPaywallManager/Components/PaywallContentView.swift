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
            if let iconName = model.iconName {
                Image(systemName: iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.blue)
            }
            
            Text(model.title)
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
            
            Text(model.subtitle)
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    EMIconLabel(messages: model.features, isAnimated: true)
                }
            }
            .padding()
            
            Text(model.price)
                .font(.title2)
                .bold()
        }
    }
}

#Preview {
    PaywallContentView(model: PaywallModel.mock)
}
