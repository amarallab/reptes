//
//  ReptesDecoder.swift
//  Reptes
//
//  Created by Heliodoro Tejedor Navarro on 3/31/22.
//

import Foundation

public protocol BlockDecoder {
    func decode(from decoder: Decoder) throws -> Block
}

public class ReptesDecoder: ObservableObject {
    private struct AnonymousBlockDecoder: BlockDecoder {
        let block: (Decoder) throws -> Block

        func decode(from decoder: Decoder) throws -> Block {
            try block(decoder)
        }
    }
    
    internal var decoders: [String: BlockDecoder]
    
    public init(registerBasics: Bool = true) {
        if registerBasics {
            decoders = [
                "button": AnonymousBlockDecoder { try BlockButton(from: $0) },
                "image": AnonymousBlockDecoder { try BlockImage(from: $0) },
                "map": AnonymousBlockDecoder { try BlockMap(from: $0) },
                "markdown": AnonymousBlockDecoder { try BlockMarkdown(from: $0) }
            ]
        } else {
            decoders = [:]
        }
    }

    @discardableResult
    public func register<T: Block>(_ type: T.Type, as typeName: String) throws -> Self {
        if decoders.keys.contains(typeName) {
            throw ReptesDecodingError.duplicatedDecoder
        }
        decoders[typeName] = AnonymousBlockDecoder { try T(from: $0) }
        return self
    }
    
    public func decode(from data: Data) throws -> Challenge {
        guard
            let reptesDecoderKey = CodingUserInfoKey(rawValue: "ReptesDecoder")
        else {
            throw ReptesDecodingError.internalError
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.dataDecodingStrategy = .base64
        decoder.userInfo[reptesDecoderKey] = self
        return try decoder.decode(Challenge.self, from: data)
    }
}
