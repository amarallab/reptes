//
//  BlockButton.swift
//  Reptes
//
//  Created by Heliodoro Tejedor Navarro on 4/1/22.
//

import Foundation

public struct BlockButton: Block, Codable, Equatable {
    public var id: UUID
    public var localizedText: LocalizedText
    public var foregroundColor: JSONColor?
    public var backgroundColor: JSONColor?
    public var action: ButtonAction
    
    public init(id: UUID, localizedText: LocalizedText, foregroundColor: JSONColor? = nil, backgroundColor: JSONColor? = nil, action: ButtonAction) {
        self.id = id
        self.localizedText = localizedText
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.action = action
    }
}
