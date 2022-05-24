//
//  BlockMarkdown.swift
//  Reptes
//
//  Created by Heliodoro Tejedor Navarro on 4/1/22.
//

import Foundation

public struct BlockMarkdown: Block, Codable, Equatable {
    public var id: UUID
    public var localizedText: LocalizedText
    public var backgroundTransparent: Bool?
    public var underlined: Bool?
    
    public init(id: UUID, localizedText: LocalizedText, backgroundTransparent: Bool? = nil, underlined: Bool? = nil) {
        self.id = id
        self.localizedText = localizedText
        self.backgroundTransparent = backgroundTransparent
        self.underlined = underlined
    }
}
