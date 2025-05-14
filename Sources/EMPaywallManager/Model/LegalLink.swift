//
//  File.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 8.05.2025.
//

import Foundation

public struct LegalLink: Identifiable, Hashable {
    public let id = UUID()
    public let title: String
    public let url: String
    
    public init(title: String, url: String) {
        self.title = title
        self.url = url
    }
}
