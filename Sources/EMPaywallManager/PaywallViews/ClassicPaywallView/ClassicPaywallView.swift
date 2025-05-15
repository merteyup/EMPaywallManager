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
        VStack(spacing: 16) {
            DismissButton(alignment: .leading,
                          onDismiss: viewModel.onDismiss)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 16)

            Spacer()

            IconWithTitleView(model: viewModel.model)

            PaywallContentView(model: viewModel.model)

            Spacer()

            PaywallFooterView(model: viewModel.model,
                              onSubscribe: viewModel.onSubscribe,
                              onRestore: viewModel.onRestore,
                              onDismiss: viewModel.onDismiss,
                              selectedFeature: $viewModel.selectedFeature)
        }
        .padding()
    }
}

#Preview {
    let viewModel = ClassicPaywallViewModel(
        model: PaywallModel.mockClassic,
        onSubscribe: { _ in },
        onRestore: {},
        onDismiss: {}
    )
    return ClassicPaywallView(viewModel: viewModel)
}
