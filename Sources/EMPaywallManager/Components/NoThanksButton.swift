//
//  NoThanksButton.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 14.05.2025.
//

import SwiftUI

struct NoThanksButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text("No thanks")
                .fontWeight(.bold)
                .underline()
                .foregroundStyle(.white)
        }
        .padding(.bottom, LayoutConstants.padding)
    }
}
