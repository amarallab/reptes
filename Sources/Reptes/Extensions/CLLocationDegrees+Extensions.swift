//
//  File.swift
//  
//
//  Created by Heliodoro Tejedor Navarro on 5/13/22.
//

import Foundation
import CoreLocation

public extension CLLocationDegrees {
    enum WrappingDimension: Double {
        case latitude = 180
        case longitude = 360
    }

    mutating func wrapped(dimension: WrappingDimension) {
        let length = dimension.rawValue
        let halfLength = length/2.0
        let angle = self.truncatingRemainder(dividingBy: length)
        switch dimension {
        case .longitude:
            self = angle < -halfLength ? length + angle : angle > halfLength ? -length + angle : angle
        case .latitude:
            self = angle < -halfLength ? -length - angle : angle > halfLength ? length - angle : angle
        }
    }
}
