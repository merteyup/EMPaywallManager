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
    public let url: URL
    
    public init(title: String, url: URL) {
        self.title = title
        self.url = url
    }
}
