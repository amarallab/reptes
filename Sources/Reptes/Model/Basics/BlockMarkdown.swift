//
//  BlockMarkdown.swift
//  Reptes
//
//  Created by Heliodoro Tejedor Navarro on 4/1/22.
//

import Foundation

public struct BlockMarkdownUnveil: Codable, Equatable, Hashable {
    public var unveilText: LocalizedText
    public var waitingTime: Double
    
    public init(unveilText: LocalizedText, waitingTime: Double) {
        self.unveilText = unveilText
        self.waitingTime = waitingTime
    }
}

public struct BlockMarkdown: Block, Codable, Equatable, Hashable {
    public var id: UUID
    public var localizedText: LocalizedText
    public var backgroundTransparent: Bool?
    public var underlined: Bool?
    public var unveil: BlockMarkdownUnveil?
    
    public init(id: UUID, localizedText: LocalizedText, backgroundTransparent: Bool? = nil, underlined: Bool? = nil, unveil: BlockMarkdownUnveil? = nil) {
        self.id = id
        self.localizedText = localizedText
        self.backgroundTransparent = backgroundTransparent
        self.underlined = underlined
        self.unveil = unveil
    }
}
