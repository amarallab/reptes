//
//  ReptesEncodingError.swift
//  Reptes
//
//  Created by Heliodoro Tejedor Navarro on 4/8/22.
//

import Foundation

public enum ReptesEncodingError: Error {
    case duplicatedEncoder
    case internalError
    case blockEncoderNotFound(Block)
}
