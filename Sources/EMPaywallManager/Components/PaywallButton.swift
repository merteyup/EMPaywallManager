//
//  PaywallButton.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 8.05.2025.
//

import SwiftUI


public struct PaywallButton: View {
    let title: String
    let action: () -> Void
    
    public init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(Color.blue)
                .clipShape(Capsule())
        }
        .padding()
        .clipShape(.capsule)
    }
}

#Preview {
    PaywallButton(title: "Tap to Subscribe") {
        print("Subscription tapped")
    }
}
    
