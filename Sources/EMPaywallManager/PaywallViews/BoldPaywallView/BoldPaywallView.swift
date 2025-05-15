//
//  SwiftUIView.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 13.05.2025.
//

import SwiftUI


public struct BoldPaywallView: PaywallViewProtocol {

    @StateObject public var viewModel: BoldPaywallViewModel

    public init(viewModel: BoldPaywallViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        ZStack {
            
            if let background = viewModel.mainBackground {
                background
            } else {
                LinearGradient(colors: [.yellow, .orange, .red, Color("#252378")],
                               startPoint: .topTrailing,
                               endPoint: .bottomLeading)
                .ignoresSafeArea()
            }
           
            VStack(alignment: .leading, spacing: 0) {
                DismissButton(alignment: .trailing, backgroundColor: .clear) {
                    viewModel.onDismiss?()
                }

                Spacer()

                if let iconName = viewModel.iconName {
                    Image(systemName: iconName)
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, LayoutConstants.padding)
                        .padding(.bottom, LayoutConstants.padding)
                }

                Text(viewModel.model.title)
                    .font(.largeTitle.weight(.black))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, LayoutConstants.padding)
                    .padding(.bottom, LayoutConstants.padding)

                Text(viewModel.model.subtitle)
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, LayoutConstants.padding)
                    .padding(.bottom, LayoutConstants.smallPadding)

                Text(viewModel.priceText)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, LayoutConstants.padding)
                    .padding(.bottom, LayoutConstants.padding)

                PaywallButton(with: viewModel.model.paywallButton) {
                    viewModel.onSubscribe?(viewModel.selectedFeature)
                }

                NoThanksButton {
                    viewModel.onDismiss?()
                }

                if let legalTextArea = viewModel.model.legalTextArea {
                    RichTextLinkView(legalTextArea: legalTextArea)
                        .padding(.top, LayoutConstants.padding)
                        .padding(.horizontal, LayoutConstants.padding)
                        .padding(.bottom, LayoutConstants.legalBottomPadding)
                }
            }
        }
    }
}



#Preview {
    let viewModel = BoldPaywallViewModel(
        model: PaywallModel.mockBold,
        onSubscribe: { _ in },
        onRestore: { },
        onDismiss: { }
    )
    return BoldPaywallView(viewModel: viewModel)
}
