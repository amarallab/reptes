//
//  File.swift
//  
//
//  Created by Heliodoro Tejedor Navarro on 5/13/22.
//

import Foundation

public enum ButtonAction: Codable, Equatable {
    case next
    case previous
    case close
    case custom(String)
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(String.self)
        switch value {
        case "next":
            self = .next
        case "previous":
            self = .previous
        case "close":
            self = .close
        default:
            self = .custom(value)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .next:
            try container.encode("next")
        case .previous:
            try container.encode("previous")
        case .close:
            try container.encode("close")
        case .custom(let paramValue):
            try container.encode(paramValue)
        }
    }
}
