//
//  File.swift
//  
//
//  Created by Heliodoro Tejedor Navarro on 6/2/22.
//

import Foundation
import Reptes

extension Array where Element == any Block {
    public static let preview: [any Block] = [
        BlockMarkdown(id: UUID(), localizedText: .init(values: ["en": "Final page"])),
        BlockImage.preview,
        BlockButton(id: UUID(), localizedText: .init(values: ["en": "Previous"]), action: .previous),
        BlockButton(id: UUID(), localizedText: .init(values: ["en": "Close"]), action: .close)
    ]
}
