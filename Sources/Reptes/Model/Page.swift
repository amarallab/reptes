//
//  Page.swift
//  Reptes
//
//  Created by Heliodoro Tejedor Navarro on 4/1/22.
//

import Foundation

public struct Page: Codable, Equatable, Identifiable {
    public var id: UUID
    public var title: String
    public var blocks: [Block]

    enum CodingKeys: String, CodingKey {
        case id, title, blocks
    }
    
    enum BlockTypeCodingKeys: String, CodingKey {
        case type
    }
    
    public init(id: UUID, title: String, blocks: [Block]) {
        self.id = id
        self.title = title
        self.blocks = blocks
    }

    public init(from decoder: Decoder) throws {
        guard
            let reptesDecoderKey = CodingUserInfoKey(rawValue: "ReptesDecoder"),
            let reptesDecoder = decoder.userInfo[reptesDecoderKey] as? ReptesDecoder
        else {
            throw ReptesDecodingError.internalError
        }

        let container = try decoder.container(keyedBy: CodingKeys.self)
        var blockContainer = try container.nestedUnkeyedContainer(forKey: .blocks)
        var blocks: [Block] = []
        while !blockContainer.isAtEnd {
            let decoder = try blockContainer.superDecoder()
            let container  = try decoder.container(keyedBy: BlockTypeCodingKeys.self)
            let typeName = try container.decode(String.self, forKey: .type)
            guard
                let blockDecoder = reptesDecoder.decoders[typeName]
            else {
                throw ReptesDecodingError.blockTypeNotFound(typeName)
            }
            let result = try blockDecoder.decode(from: decoder)
            blocks.append(result)
        }
        self.id = try container.decode(UUID.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.blocks = blocks
    }

    public static func == (lhs: Page, rhs: Page) -> Bool {
        guard lhs.id == rhs.id else { return false }
        guard lhs.title == rhs.title else { return false }
        guard lhs.blocks.count == rhs.blocks.count else { return false }
        for (lhs, rhs) in zip(lhs.blocks, rhs.blocks) {
            guard lhs.isEqual(to: rhs) else { return false }
        }
        return true
    }
    
    public func encode(to encoder: Encoder) throws {
        guard
            let reptesEncoderKey = CodingUserInfoKey(rawValue: "ReptesEncoder"),
            let reptesEncoder = encoder.userInfo[reptesEncoderKey] as? ReptesEncoder
        else {
            throw ReptesEncodingError.internalError
        }
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        var blockContainer = container.nestedUnkeyedContainer(forKey: .blocks)
        for block in blocks {
            let encoder = blockContainer.superEncoder()
            var container = encoder.container(keyedBy: BlockTypeCodingKeys.self)
            var notFound = true
            for (typeName, blockEncoder) in reptesEncoder.encoders {
                if !blockEncoder.canEncode(block: block) {
                    continue
                }
                try container.encode(typeName, forKey: .type)
                try blockEncoder.encode(block: block, to: encoder)
                notFound = false
                break
            }
            if notFound {
                throw ReptesEncodingError.blockEncoderNotFound(block)
            }
        }
    }
}
