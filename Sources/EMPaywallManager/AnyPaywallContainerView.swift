//
//  AnyPaywallContainerView.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 8.05.2025.
//

import SwiftUI

public struct AnyPaywallContainerView: View {
    private let viewBuilder: () -> AnyView

    public init<T: PaywallViewProtocol>(_ view: T) {
        self.viewBuilder = {
            AnyView(view)
        }
    }

    public var body: some View {
        viewBuilder()
    }
}
