//
//  ReptesEncoder.swift
//  
//
//  Created by Heliodoro Tejedor Navarro on 4/8/22.
//

import Foundation

protocol BlockEncoder {
    func canEncode(block: Block) -> Bool
    func encode(block: Block, to encoder: Encoder) throws
}

public class ReptesEncoder: ObservableObject {
    private struct AnonymousBlockEncoder<T: Block>: BlockEncoder {
        func canEncode(block: Block) -> Bool {
            block is T
        }
        func encode(block: Block, to encoder: Encoder) throws {
            try block.encode(to: encoder)
        }
    }
    
    internal var encoders: [String: BlockEncoder]
    
    public init(registerBasics: Bool = true) {
        if registerBasics {
            encoders = [
                "button": AnonymousBlockEncoder<BlockButton>(),
                "image": AnonymousBlockEncoder<BlockImage>(),
                "map": AnonymousBlockEncoder<BlockMap>(),
                "markdown": AnonymousBlockEncoder<BlockMarkdown>()
            ]
        } else {
            encoders = [:]
        }
    }

    @discardableResult
    public func register<T: Block>(_ type: T.Type, as typeName: String) throws -> Self {
        if encoders.keys.contains(typeName) {
            throw ReptesDecodingError.duplicatedDecoder
        }
        encoders[typeName] = AnonymousBlockEncoder<T>()
        return self
    }
    
    public func encode(_ value: Challenge) throws -> Data {
        guard
            let reptesEncoderKey = CodingUserInfoKey(rawValue: "ReptesEncoder")
        else {
            throw ReptesDecodingError.internalError
        }

        let encoder = JSONEncoder()
        encoder.dataEncodingStrategy = .base64
        encoder.userInfo[reptesEncoderKey] = self
        return try encoder.encode(value)
    }
}
