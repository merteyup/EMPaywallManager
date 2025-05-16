//
//  ModernPaywallView.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 8.05.2025.
//

import SwiftUI

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
                    
                    IconWithTitleView(model: viewModel.model)
                    
                    PaywallContentView(model: viewModel.model)
                                        
                    PaywallFooterView(model: viewModel.model,
                                      onSubscribe: viewModel.onSubscribe,
                                      onRestore: viewModel.onRestore,
                                      onDismiss: viewModel.onDismiss,
                                      selectedFeature: $viewModel.selectedFeature)
                    Spacer()
                }
                .padding()
            }
        }
    }
}

#Preview {
    let viewModel = ModernPaywallViewModel(
        model: PaywallModel.mockModern,
        onSubscribe: { _ in },
        onRestore: {},
        onDismiss: {}
    )
    return ModernPaywallView(viewModel: viewModel)
}
