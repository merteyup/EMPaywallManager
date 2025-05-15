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
        ZStack {
            
            if let background = viewModel.mainBackground {
                background
            }
            
            VStack {
                HStack {
                    Text(viewModel.model.title)
                        .font(.title.weight(.bold))
                        .foregroundColor(.primary)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Button {
                        viewModel.onDismiss?()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
                
                Divider()
                
                Text(viewModel.model.subtitle)
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.primary)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                
                SubscriptionView(model: viewModel.model, selectedFeature: $viewModel.selectedFeature)
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


struct SubscriptionView: View {
    @State private var selectedOptionIndex: Int = 0
    var model: PaywallModel
    @Binding var selectedFeature: Feature
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(model.features.indices, id: \.self) { index in
                SubscriptionOption(
                    index: index,
                    title: model.features[index].title,
                    price: model.features[index].price,
                    description: model.features[index].description,
                    isSelected: selectedOptionIndex == index,
                    onTap: {
                        selectedOptionIndex = index
                        selectedFeature = self.model.features[index]
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
    var description: String
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
                        
                        Text(description)
                            .fontWeight(.light)
                            .font(.caption)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    Spacer()
                }
                .padding()
                .background(Color.primary.opacity(0.03))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
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
            
            PaywallButton(with: model.paywallButton) {
                onSubscribe?(selectedFeature)
            }
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
