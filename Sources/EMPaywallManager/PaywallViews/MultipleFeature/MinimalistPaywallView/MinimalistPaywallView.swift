//
//  SwiftUIView.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 11.05.2025.
//

import SwiftUI


public struct MinimalistPaywallView: PaywallViewProtocol {
    @StateObject public var viewModel: MinimalistPaywallViewModel
    
    public init(viewModel: MinimalistPaywallViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        ScrollView {
            ZStack {
                if let background = viewModel.mainBackground {
                    background
                }
                
                VStack {
                    HStack(alignment: .bottom) {
                        Text(viewModel.model.title)
                            .font(.title.weight(.bold))
                            .foregroundColor(.primary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        DismissButton(model: viewModel.model.dismissButton) {
                            viewModel.onDismiss?()
                        }
                    }
                    
                    Divider()
                    
                    Spacer()
                    
                    Text(viewModel.model.subtitle)
                        .font(.largeTitle.weight(.bold))
                        .foregroundColor(.primary)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    SubscriptionView(viewModel: viewModel, selectedFeature: $viewModel.selectedFeature)
                        .padding(.top, 20)
                    
                    Spacer()
                    
                    ActionButtonsView(
                        model: viewModel.model,
                        onSubscribe: viewModel.onSubscribe,
                        onRestore: viewModel.onRestore,
                        onDismiss: viewModel.onDismiss,
                        selectedFeature: $viewModel.selectedFeature
                    )
                    .padding(.top, 20)
                }
                .padding()
                .frame(maxHeight: .infinity)
            }
        }
    }
}


struct SubscriptionView: View {
    @State private var selectedOptionIndex: Int = 0
    @ObservedObject var viewModel: MinimalistPaywallViewModel
    @Binding var selectedFeature: Feature
    
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(viewModel.model.features.indices, id: \.self) { index in
                SubscriptionOption(
                    index: index,
                    title: viewModel.model.features[index].title,
                    price: viewModel.model.features[index].price,
                    descriptions: viewModel.model.features[index].descriptions,
                    isSelected: selectedOptionIndex == index,
                    onTap: {
                        selectedOptionIndex = index
                        selectedFeature = self.viewModel.model.features[index]
                    }
                )
            }
        }
        .padding()
    }
}

struct SubscriptionOption: View {
    var index: Int
    var title: String
    var price: String
    var descriptions: [String]
    var isSelected: Bool
    var onTap: () -> Void
    
    var body: some View {
        HStack {
            Button(action: onTap) {
                HStack {
                    Image(systemName: isSelected ? "circle.fill" : "circle")
                        .foregroundColor(isSelected ? .blue : .gray)
                    
                    VStack(alignment: .leading) {
                        Text(title)
                            .fontWeight(.semibold)
                            .font(.headline)
                            .foregroundColor(.primary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(price)
                            .font(.caption)
                            .foregroundColor(.primary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 2)
                        
                        ForEach(descriptions, id: \.self) { description in
                            Text(description)
                                .fontWeight(.light)
                                .font(.caption)
                                .foregroundColor(.gray)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    
                    Spacer()
                }
                .padding()
                .background(Color.primary.opacity(0.03))
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.blue.opacity(0.3), lineWidth: 1)
                )
            }
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: .gray.opacity(0.2), radius: 10, x: 0, y: 10)
        }
        .frame(maxWidth: .infinity)
    }
}

struct ActionButtonsView: View {
    var model: PaywallModel
    var onSubscribe: ((Feature) -> Void)?
    var onRestore: (() -> Void)?
    var onDismiss: (() -> Void)?
    @Binding var selectedFeature: Feature
    
    var body: some View {
        HStack(spacing: 20) {
            Button(action: {
                onDismiss?()
            }) {
                Text("Cancel")
                    .font(.headline)
                    .foregroundColor(.blue)
                    .frame(width: 150, height: 50)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.blue.opacity(0.3), lineWidth: 1)
                    )
            }
            .frame(minWidth: 150, maxWidth: .infinity)
            
            PaywallButton(with: model.paywallButton) {
                onSubscribe?(selectedFeature)
            }
            .frame(minWidth: 150, maxWidth: .infinity)
        }
        .padding()
    }
}

#Preview {
    let viewModel = MinimalistPaywallViewModel(
        model: PaywallModel.mockMinimal,
        onSubscribe: { feature in print("Subscribed \(feature)") },
        onRestore: { print("Restored") },
        onDismiss: { print("Dismissed") }
    )
    return MinimalistPaywallView(viewModel: viewModel)
}
