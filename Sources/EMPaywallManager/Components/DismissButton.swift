//
//  DismissButton.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 8.05.2025.
//

import SwiftUI

struct DismissButton: View {
    var alignment: Alignment
    var backgroundColor: Color = .blue
    let onDismiss: (() -> Void)?
    
    var body: some View {
        HStack {
            Button(action: {
                onDismiss?()
            }) {
                Image(systemName: "xmark")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(backgroundColor)
                    .clipShape(Circle())
            }
            .padding()
        }
        .frame(maxWidth: .infinity, alignment: alignment)
        .padding(.top, 16)
    }
}

#Preview {
    DismissButton(alignment: .leading) {
        print("Subscribed")
    }
}
