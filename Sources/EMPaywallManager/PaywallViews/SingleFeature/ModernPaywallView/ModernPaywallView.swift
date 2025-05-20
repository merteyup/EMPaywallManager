//
//  ModernPaywallView.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 8.05.2025.
//

import SwiftUI

// TODO: Design improvements will be provided in the future.

public struct ModernPaywallView: PaywallViewProtocol {
    @StateObject public var viewModel: ModernPaywallViewModel
    
    public init(viewModel: ModernPaywallViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        
        ScrollView {
            ZStack {
                if let background = viewModel.mainBackground {
                    background
                }
                
                VStack(spacing: 16) {
                    DismissButton(model: viewModel.model.dismissButton) {
                        viewModel.onDismiss?()
                    }.frame(maxWidth: .infinity,
                            alignment: .trailing)
                    .padding(.top, 16)
                    
                    Spacer()
                    
                    if let icon = viewModel.model.mainIcon {
                        Image(systemName: icon.name)
                            .font(.system(size: 100))
                            .foregroundStyle(.purple)
                    }
                    
                    Spacer()
                    
                    let descriptions = (viewModel.model.features.first?.descriptions).flatMap { $0.isEmpty ? nil : $0 } ?? Feature.defaultDescriptions
                    let titles = ["Today", "In 5 Days", "In 7 Days"]

                    ForEach(Array(zip(titles, descriptions)), id: \.1) { title, description in
                        HStack(alignment: .top, spacing: 12) {
                            VStack {
                                Image(systemName: "lock")
                                    .font(.system(size: 32))
                                    .foregroundStyle(.purple)
                                Rectangle()
                                    .frame(width: 2, height: 30)
                                    .foregroundColor(.gray)
                            }
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(title)
                                    .font(.title2.bold())
                                    .foregroundStyle(.purple)
                                Text(description)
                                    .font(.subheadline)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, LayoutConstants.padding)
                    }
                    
                    Spacer()
                    
                    PaywallButton(
                        with: viewModel.model.paywallButton ?? .init(
                            title: "Try For \(viewModel.model.features[0].price.formattedAsCurrency())",
                            backgroundColor: .purple,
                            foregroundColor: .white,
                            cornerRadius: 12
                        )
                    ) {
                        viewModel.onSubscribe?(
                            viewModel.selectedFeature
                        )
                    }
                    .padding(.bottom, LayoutConstants.padding)
                    
                    Spacer()
                   
                    decorativeGradientFooter
                }
                .padding()
            }.frame(minHeight: UIScreen.main.bounds.height)
        }
    }
    
    struct DecorativeGradientBackground: View {
        var body: some View {
            LinearGradient(
                colors: [.purple.opacity(0.4), .pink.opacity(0.3), .clear],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        }
    }
    
    private var decorativeGradientFooter: some View {
        DecorativeGradientBackground()
        .blur(radius: 30)
        .frame(height: 300)
        .frame(maxWidth: .infinity)
        .clipShape(
            RoundedRectangle(cornerRadius: 60, style: .continuous)
        )
        .padding(.bottom, -100)
        .offset(y: 100)
    }

}

#Preview {
    let viewModel = ModernPaywallViewModel(
        model: SimplePaywallModel(feature: Feature(
            id: "feature_1",
            title: "Buy now",
            descriptions: ["Description for this product, Description for this product",
                           "Another feature in this product, Another feature in this product"],
            price: "12.00"
        )
        ).toPaywallModel(),
        onSubscribe: { _ in },
        onRestore: {},
        onDismiss: {}
    )
    return ModernPaywallView(viewModel: viewModel)
}
