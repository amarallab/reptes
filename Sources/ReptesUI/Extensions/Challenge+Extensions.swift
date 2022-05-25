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
    static let missingBlockPreview = Challenge(
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
    
    static let multipagePreview = Challenge(
        id: UUID(),
        card: .init(id: UUID()),
        title: .empty,
        pages: [
            .init(
                id: UUID(),
                title: "",
                blocks: [
                    BlockMarkdown(id: UUID(), localizedText: .init(values: ["en": "First page"])),
                    BlockImage.preview,
                    BlockButton(id: UUID(), localizedText: .init(values: ["en": "Next"]), action: .next)
                ]
            ),
            .init(
                id: UUID(),
                title: "",
                blocks: [
                    BlockMarkdown(id: UUID(), localizedText: .init(values: ["en": "Second page"])),
                    BlockImage.preview,
                    BlockButton(id: UUID(), localizedText: .init(values: ["en": "Previous"]), action: .previous),
                    BlockButton(id: UUID(), localizedText: .init(values: ["en": "Next"]), action: .next)
                ]
            ),
            .init(
                id: UUID(),
                title: "",
                blocks: [
                    BlockMarkdown(id: UUID(), localizedText: .init(values: ["en": "Final page"])),
                    BlockImage.preview,
                    BlockButton(id: UUID(), localizedText: .init(values: ["en": "Previous"]), action: .previous),
                    BlockButton(id: UUID(), localizedText: .init(values: ["en": "Close"]), action: .close)
                ]
            )
        ])
    
}
