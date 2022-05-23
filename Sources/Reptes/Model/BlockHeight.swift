//
//  BlockHeight.swift
//  
//
//  Created by Heliodoro Tejedor Navarro on 4/16/22.
//

import Foundation
import CoreGraphics

public enum BlockHeight: String, Codable {
    case reduced
    case regular
    case huge
}

extension BlockHeight {
    public var screenValue: CGFloat {
        switch self {
        case .reduced: return 100
        case .regular: return 200
        case .huge: return 400
        }
    }
}
