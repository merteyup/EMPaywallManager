//
//  SwiftUIView 2.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 8.05.2025.
//

import SwiftUI

struct PaywallFooterView: View {
    let model: PaywallModel
    let onSubscribe: ((Feature) -> Void)?
    let onRestore: (() -> Void)?
    let onDismiss: (() -> Void)?
    @Binding var selectedFeature: Feature
    
    var body: some View {
        VStack(spacing: 8) {
            PaywallButton(
                with: model.paywallButton ?? .init(
                    title: "Get Now",
                    backgroundColor: .blue,
                    foregroundColor: .white,
                    cornerRadius: 20
                )
            ) {
                onSubscribe?(selectedFeature)
            }
            
            Button("Not now") {
                onDismiss?()
            }
            .font(.footnote)
            .foregroundColor(.secondary)
            .padding(.top, LayoutConstants.smallPadding)
            
            Button("Restore Purchases") {
                onRestore?()
            }
            .font(.footnote)
            .foregroundColor(.blue)
            .padding(.top, LayoutConstants.highPadding)
           
            
            if let legalTextArea = model.legalTextArea,
               let links = legalTextArea.legalLinks {
                HStack(spacing: 4) {
                    ForEach(links) { link in
                        Button(link.title) {
                            guard let url = URL(string: link.url) else { return }
#if os(iOS) || os(tvOS)
                            UIApplication.shared.open(url)
#elseif os(macOS)
                            NSWorkspace.shared.open(url)
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
    @State var selectedFeature = PaywallModel.mockClassic.features.first!
    PaywallFooterView(
        model: PaywallModel.mockClassic,
        onSubscribe: { feature in print("Subscribed \(feature)") },
        onRestore: { print("Restored") },
        onDismiss: { print("Dismissed") },
        selectedFeature: $selectedFeature
    )
}
