//
//  BlockMap.swift
//  Reptes
//
//  Created by Heliodoro Tejedor Navarro on 4/1/22.
//

import Foundation
import MapKit

public struct BlockMap: Block, Codable, Equatable {
    public var id: UUID
    public var height: BlockHeight
    public var coordinateRegion: MKCoordinateRegion = .northwestern
}
