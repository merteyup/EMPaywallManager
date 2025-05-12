//
//  PaywallABManager.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 8.05.2025.
//

import SwiftUI

final class PaywallABManager {
    private let key = "selectedPaywallType"

    static let shared = PaywallABManager()

    private init() {}

    var assignedType: PaywallType {
        if let raw = UserDefaults.standard.string(forKey: key),
           let type = PaywallType(rawValue: raw) {
            return type
        } else {
            let randomType = PaywallType.allCases.randomElement()!
            UserDefaults.standard.set(randomType.rawValue, forKey: key)
            return randomType
        }
    }
}
