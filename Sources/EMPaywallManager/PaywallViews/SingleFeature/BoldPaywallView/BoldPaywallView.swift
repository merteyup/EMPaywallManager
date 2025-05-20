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
    
    private var backgroundView: some View {
        Group {
            if let background = viewModel.mainBackground {
                background
            } else {
                LinearGradient(colors: [.yellow, .orange, .red],
                               startPoint: .topTrailing,
                               endPoint: .bottomLeading)
            }
        }
        .ignoresSafeArea()
    }

    
    public var body: some View {
              
        ZStack {
            
            backgroundView
            
            GeometryReader { geometry in
                let topSpacing = geometry.size.height * 0.05
                let buttonSpacing = geometry.size.height * 0.1
                let contentSpacing = geometry.size.height * 0.04
                
                ScrollView {
                    VStack(alignment: .leading) {
                        DismissButton(model: viewModel.model.dismissButton) {
                            viewModel.onDismiss?()
                        }
                        .padding(.top, topSpacing)
                        .padding(.trailing, LayoutConstants.padding)
                        
                        VStack {
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
                                .padding(.bottom, LayoutConstants.highPadding)
                            
                            PaywallButton(
                                with: viewModel.model.paywallButton ?? .init(
                                    title: "Get Now",
                                    backgroundColor: .yellow,
                                    foregroundColor: .black,
                                    cornerRadius: 12
                                )
                            ) {
                                viewModel.onSubscribe?(viewModel.selectedFeature)
                            }
                            .padding(.top, buttonSpacing)
                            .padding(.horizontal, LayoutConstants.padding)
                            .padding(.bottom, LayoutConstants.smallPadding)
                            
                            NoThanksButton {
                                viewModel.onDismiss?()
                            }
                            .frame(maxWidth: .infinity, alignment: .center)
                            
                            if let legalTextArea = viewModel.model.legalTextArea {
                                RichTextLinkView(legalTextArea: legalTextArea)
                                    .padding(.top, LayoutConstants.padding)
                                    .padding(.horizontal, LayoutConstants.padding)
                                    .padding(.bottom, LayoutConstants.legalBottomPadding)
                            }
                        }
                        .padding(.top, contentSpacing)
                        .padding(.bottom, LayoutConstants.highPadding)
                    }
                    .frame(maxWidth: .infinity, minHeight: geometry.size.height)
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
