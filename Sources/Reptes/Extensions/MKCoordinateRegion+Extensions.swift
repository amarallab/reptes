//
//  File.swift
//  
//
//  Created by Heliodoro Tejedor Navarro on 5/13/22.
//

import Foundation
import MapKit

public extension MKCoordinateRegion {
    /// middle of the south edge
    var south: CLLocation {
        return CLLocation(latitude: center.latitude - span.latitudeDelta / 2, longitude: center.longitude)
    }
    /// middle of the north edge
    var north: CLLocation {
        return CLLocation(latitude: center.latitude + span.latitudeDelta / 2, longitude: center.longitude)
    }
    /// middle of the east edge
    var east: CLLocation {
        return CLLocation(latitude: center.latitude, longitude: center.longitude + span.longitudeDelta / 2)
    }
    /// middle of the west edge
    var west: CLLocation {
        return CLLocation(latitude: center.latitude, longitude: center.longitude - span.longitudeDelta / 2)
    }
    /// distance between south and north in meters. Reverse function for MKCoordinateRegionMakeWithDistance
    var latitudinalMeters: CLLocationDistance {
        return south.distance(from: north)
    }
    /// distance between east and west in meters. Reverse function for MKCoordinateRegionMakeWithDistance
    var longitudinalMeters: CLLocationDistance {
        return east.distance(from: west)
    }
}

extension MKCoordinateRegion: Codable, Equatable, Hashable {
    enum CodingKeys: String, CodingKey {
        case latitude, longitude, latitudinalMeters, longitudinalMeters
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let latitude = try container.decode(Double.self, forKey: .latitude)
        let longitude = try container.decode(Double.self, forKey: .longitude)
        let latitudinalMeters = try container.decode(Double.self, forKey: .latitudinalMeters)
        let longitudinalMeters = try container.decode(Double.self, forKey: .longitudinalMeters)
        self = MKCoordinateRegion(center: .init(latitude: latitude, longitude: longitude), latitudinalMeters: latitudinalMeters, longitudinalMeters: longitudinalMeters)
        self.span.wrapped()
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(center.latitude, forKey: .latitude)
        try container.encode(center.longitude, forKey: .longitude)
        try container.encode(latitudinalMeters, forKey: .latitudinalMeters)
        try container.encode(longitudinalMeters, forKey: .longitudinalMeters)
    }
    
    public static func==(lhs: MKCoordinateRegion, rhs: MKCoordinateRegion) -> Bool {
        return abs(lhs.center.latitude - rhs.center.latitude) < 0.001
            && abs(lhs.center.longitude - rhs.center.longitude) < 0.001
            && abs(lhs.span.latitudeDelta - rhs.span.latitudeDelta) < 0.001
            && abs(lhs.span.longitudeDelta - rhs.span.longitudeDelta) < 0.001
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(center.latitude)
        hasher.combine(center.longitude)
        hasher.combine(span.latitudeDelta)
        hasher.combine(span.longitudeDelta)
    }
}

extension MKCoordinateRegion {
    public static let northwestern = MKCoordinateRegion(center: .init(latitude: 42.057160404161934, longitude: -87.67492367721856), latitudinalMeters: 1_000, longitudinalMeters: 1_000)
}
