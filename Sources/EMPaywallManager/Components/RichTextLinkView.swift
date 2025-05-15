//
//  RichTextLinkView.swift
//  EMPaywallManager
//
//  Created by Eyüp Mert on 14.05.2025.
//

import SwiftUI

struct RichTextLinkView: View {
    var legalTextArea: LegalTextArea
    
    var body: some View {
        Text(attributedText)
            .font(.caption)
            .onOpenURL { url in
                UIApplication.shared.open(url)
            }
    }
    
    var attributedText: AttributedString {
        var str = AttributedString(legalTextArea.legalText)
        guard let legalLinks = legalTextArea.legalLinks else { return str }
        for link in legalLinks {
            if let range = str.range(of: link.title) {
                str[range].foregroundColor = .blue
                str[range].underlineStyle = .single
                str[range].link = URL(string: link.url)
            }
        }
        return str
    }
}


#Preview {
    RichTextLinkView(legalTextArea: LegalTextArea(legalText: "Privacy Policy",
                                                  legalLinks: nil))
}
