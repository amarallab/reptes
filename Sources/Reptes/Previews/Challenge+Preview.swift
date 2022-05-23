//
//  File.swift
//  
//
//  Created by Heliodoro Tejedor Navarro on 4/16/22.
//

import Foundation

extension Challenge {
    public static let preview = Challenge(
        id: UUID(),
        card: .init(id: UUID()),
        title: .init(values: [:]),
        pages: [
            .init(
                id: UUID(),
                title: "",
                blocks: [
                    BlockButton(
                        id: UUID(),
                        localizedText: .init(values: ["en": "Next"]),
                        action: .next),
                    BlockImage.preview,
                    BlockMap(
                        id: UUID(),
                        height: .regular,
                        coordinateRegion: .northwestern),
                    BlockMarkdown(
                        id: UUID(),
                        localizedText: .init(values: ["en": "Text *test*"]),
                        backgroundTransparent: false,
                        underlined: false)
                ])
        ])
    
}
