//
//  SwiftUIView.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 8.05.2025.
//

import SwiftUI

public struct ClassicPaywallView: PaywallViewProtocol {
    @StateObject public var viewModel: ClassicPaywallViewModel
    
    public init(viewModel: ClassicPaywallViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ScrollView {
                    VStack(spacing: 32) {
                        DismissButton(model: viewModel.model.dismissButton) {
                            viewModel.onDismiss?()
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, LayoutConstants.padding)
                        
                        IconWithTitleView(model: viewModel.model)
                        
                        PaywallContentView(model: viewModel.model)
                        
                        PaywallFooterView(model: viewModel.model,
                                          onSubscribe: viewModel.onSubscribe,
                                          onRestore: viewModel.onRestore,
                                          onDismiss: viewModel.onDismiss,
                                          selectedFeature: $viewModel.selectedFeature)
                    }
                    .frame(maxWidth: 600)
                    .padding(.horizontal)
                    Spacer(minLength: 32)
                .frame(width: geometry.size.width)
            }
        }
    }
}


#Preview {
    let viewModel = ClassicPaywallViewModel(
        model: SimplePaywallModel(feature: Feature(id: "1234",
                                                   title: "Simple as Possible",
                                                   price: "7.99")).toPaywallModel(),
        onSubscribe: { _ in },
        onRestore: {},
        onDismiss: {}
    )
    return ClassicPaywallView(viewModel: viewModel)
}
