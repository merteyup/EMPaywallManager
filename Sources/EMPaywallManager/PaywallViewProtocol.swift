//
//  PaywallViewProtocol.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 8.05.2025.
//

import SwiftUI


public protocol PaywallViewProtocol: View {
    associatedtype ViewModel: ObservableObject
    var viewModel: ViewModel { get }
}
