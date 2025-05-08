//
//  SwiftUIView 2.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 8.05.2025.
//

import SwiftUI

struct PaywallFooterView: View {
    let model: PaywallModel
    let onSubscribe: (() -> Void)?
    let onRestore: (() -> Void)?
    let onDismiss: (() -> Void)?
    
    var body: some View {
        VStack(spacing: 8) {
            PaywallButton(title: model.buttonTitle) {
                onSubscribe?()
            }
            
            Button("Restore Purchases") {
                onRestore?()
            }
            .font(.footnote)
            .foregroundColor(.blue)
            
            Button("Not now") {
                onDismiss?()
            }
            .font(.footnote)
            .foregroundColor(.secondary)
            
            if let links = model.legalLinks {
                HStack(spacing: 4) {
                    ForEach(links) { link in
                        Button(link.title) {
#if os(iOS) || os(tvOS)
                            UIApplication.shared.open(link.url)
#elseif os(macOS)
                            NSWorkspace.shared.open(link.url)
#endif
                        }
                        .font(.caption)
                        .foregroundColor(.gray)
                        
                        if link.id != links.last?.id {
                            Text("•")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(.top, 8)
            }
        }
    }
}

#Preview {
    PaywallFooterView(
        model: PaywallModel.mock,
        onSubscribe: { print("Subscribed") },
        onRestore: { print("Restored") },
        onDismiss: { print("Dismissed") }
    )
}
