//
//  PaywallViewModelProtocol.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 14.05.2025.
//

import SwiftUI

public protocol PaywallViewModelProtocol: ObservableObject {
    var model: PaywallModel { get }
    var selectedFeature: Feature { get set }
    var onSubscribe: ((Feature) -> Void)? { get }
    var onRestore: (() -> Void)? { get }
    var onDismiss: (() -> Void)? { get }
}
