//
//  DismissButton.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 8.05.2025.
//

import SwiftUI

struct DismissButton: View {
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
                    .background(Color.blue)
                    .clipShape(Circle())
            }
            .padding()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 16)
    }
}

#Preview {
    DismissButton {
        print("Subscribed") 
    }
}
