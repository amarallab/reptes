//
//  Page+Preview.swift
//  Reptes
//
//  Created by Heliodoro Tejedor Navarro on 5/23/22.
//

import Foundation

extension Page {
    public static let preview = Page(
        id: UUID(),
        title: "",
        blocks: [
            BlockButton(
                id: UUID(),
                localizedText: .init(values: [
                    "en": "Next",
                    "es": "Siguiente"]),
                action: .next),
            BlockMarkdown(
                id: UUID(),
                localizedText: .init(values: [
                    "en": "Text *test*",
                    "es": "Texto *test"]),
                backgroundTransparent: true,
                underlined: false)
        ])
}
