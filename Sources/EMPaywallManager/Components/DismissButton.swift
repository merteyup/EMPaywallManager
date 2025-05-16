//
//  DismissButton.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 8.05.2025.
//

import SwiftUI

struct DismissButton: View {
    var model: DismissButtonModel
    let onDismiss: (() -> Void)?
    
    var body: some View {
        HStack {
            Button(action: {
                onDismiss?()
            }) {
                Image(systemName: model.iconName)
                    .font(.headline)
                    .foregroundColor(model.foregroundColor)
                    .padding(10)
                    .background(model.backgroundColor)
                    .clipShape(Circle())
            }
        }
        .frame(maxWidth: .infinity, alignment: model.alignment)
    }
}

#Preview {
    DismissButton(model: DismissButtonModel()) {
        print("Subscribed")
    }
}
