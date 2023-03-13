//
//  Challenge+Extensions.swift
//  ReptesUI
//
//  Created by Heliodoro Tejedor Navarro on 5/24/22.
//

import Foundation
import Reptes

fileprivate struct BlockWeird: Block, Codable, Equatable {
    public var id: UUID
}

extension Challenge {
    public static let missingBlockPreview = Challenge(
        id: UUID(),
        card: .init(id: UUID()),
        title: .empty,
        pages: [
            .init(
                id: UUID(),
                title: "",
                blocks: [
                    BlockWeird(id: UUID()),
                    BlockImage.preview
                ]
            )
        ])
    
    public static let multipagePreview = Challenge(
        id: UUID(),
        card: .init(id: UUID()),
        title: .empty,
        pages: [
            .init(
                id: UUID(),
                title: "",
                blocks: [
                    BlockMarkdown(id: UUID(), localizedText: .init(values: [
                        "en": "First page",
                        "es": "Primera página"
                    ])),
                    BlockImage.preview,
                    BlockButton(id: UUID(), localizedText: .init(values: [
                        "en": "Next",
                        "es": "Siguiente"
                    ]), action: .next)
                ]
            ),
            .init(
                id: UUID(),
                title: "",
                blocks: [
                    BlockMarkdown(id: UUID(), localizedText: .init(values: [
                        "en": "Second page",
                        "es": "Segunda página"
                    ])),
                    BlockImage.preview,
                    BlockButton(id: UUID(), localizedText: .init(values: [
                        "en": "Previous",
                        "es": "Anterior"
                    ]), action: .previous),
                    BlockButton(id: UUID(), localizedText: .init(values: [
                        "en": "Next",
                        "es": "Siguiente"
                    ]), action: .next)
                ]
            ),
            .init(
                id: UUID(),
                title: "",
                blocks: [
                    BlockMarkdown(id: UUID(), localizedText: .init(values: [
                        "en": "Final page",
                        "es": "Página final"
                    ])),
                    BlockImage.preview,
                    BlockButton(id: UUID(), localizedText: .init(values: [
                        "en": "Previous",
                        "es": "Anterior"
                    ]), action: .previous),
                    BlockButton(id: UUID(), localizedText: .init(values: [
                        "en": "Close",
                        "es": "Cerrar"
                    ]), action: .close)
                ]
            )
        ])
}

extension Array where Element == Challenge {
    public static let preview = (1...10).map { _ in
        Challenge(
            id: UUID(),
            card: .previewTextFirst,
            title: .init(values: [
                "en": "Title (EN)",
                "es": "Title (ES)"
            ]),
            pages: .preview
        )
    }
}

