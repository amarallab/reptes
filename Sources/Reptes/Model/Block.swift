//
//  Block.swift
//  Reptes
//
//  Created by Heliodoro Tejedor Navarro on 3/31/22.
//

import Foundation

public protocol Block: Codable, Hashable {
    var id: UUID { get set }
    func isEqual(to: any Block) -> Bool
    var hashValue: Int { get }
    func hash(into hasher: inout Hasher)
}

extension Block where Self: Equatable {
    public func isEqual(to: any Block) -> Bool {
        guard let to = to as? Self else { return false }
        return to == self
    }
}
