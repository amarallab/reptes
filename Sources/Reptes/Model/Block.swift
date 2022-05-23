//
//  Block.swift
//  Reptes
//
//  Created by Heliodoro Tejedor Navarro on 3/31/22.
//

import Foundation

public protocol Block: Codable {
    var id: UUID { get set }
    func isEqual(to: Block) -> Bool
}

extension Block where Self: Equatable {
    public func isEqual(to: Block) -> Bool {
        guard let to = to as? Self else { return false }
        return to == self
    }
}
