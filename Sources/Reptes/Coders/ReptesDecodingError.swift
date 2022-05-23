//
//  ReptesDecodingError.swift
//  Reptes
//
//  Created by Heliodoro Tejedor Navarro on 4/1/22.
//

import Foundation

public enum ReptesDecodingError: Error {
    case duplicatedDecoder
    case internalError
    case blockTypeNotFound(String)
}
