//
//  IconWithTitleView.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 19.05.2025.
//

import SwiftUI

struct IconWithTitleView: View {
    let model: PaywallModel
    
    var body: some View {
        GeometryReader { geometry in
            let iconSize = min(geometry.size.width * 0.25, 120)
        
            VStack(spacing: 16) {
                if let mainIconName = model.mainIcon?.name {
                    Image(systemName: mainIconName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: iconSize, height: iconSize)
                        .foregroundColor(model.mainIcon?.color ?? .primary)
                }
                
                Text(model.title)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            .frame(width: geometry.size.width, height: nil, alignment: .center)
        }
        .frame(height: 180)
    }
}
