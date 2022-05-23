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
}
