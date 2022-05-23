//
//  File.swift
//  
//
//  Created by Heliodoro Tejedor Navarro on 5/13/22.
//

import Foundation
import MapKit

public extension MKCoordinateSpan {
    mutating func wrapped() {
        self.latitudeDelta.wrapped(dimension: .latitude)
        self.longitudeDelta.wrapped(dimension: .longitude)
    }
}
