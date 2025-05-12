//
//  PaywallViewProtocol.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 8.05.2025.
//

import SwiftUI


public protocol PaywallViewProtocol: View {
    var onSubscribe: ((Feature) -> Void)? { get set }
    var onRestore: (() -> Void)? { get set }
    var onDismiss: (() -> Void)? { get set }
}
