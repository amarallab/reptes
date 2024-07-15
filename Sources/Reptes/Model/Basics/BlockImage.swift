//
//  BlockImage.swift
//  Reptes
//
//  Created by Heliodoro Tejedor Navarro on 5/3/22.
//

import Foundation

public struct BlockImage: Block, Codable, Equatable, Hashable {
    public var id: UUID
    public var height: BlockHeight
    public var image: KYImage?
    
    enum CodingKeys: CodingKey {
        case id, height, image
    }
    
    public init(id: UUID, height: BlockHeight, image: KYImage? = nil) {
        self.id = id
        self.height = height
        self.image = image
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        height = try container.decode(BlockHeight.self, forKey: .height)
        if let data = try container.decodeIfPresent(Data.self, forKey: .image) {
            image = KYImage(data: data)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(height, forKey: .height)
        if let image = image {
            guard
                let data = image.pngData()
            else {
                let context = EncodingError.Context(codingPath: encoder.codingPath, debugDescription: "Cannot create PNG Data")
                throw EncodingError.invalidValue(self, context)
            }
            try container.encode(data, forKey: .image)
        }
    }
    
    public static func ==(lhs: BlockImage, rhs: BlockImage) -> Bool {
        lhs.id == rhs.id
        || lhs.height == rhs.height
        || lhs.image?.pngData() == rhs.image?.pngData()
    }
}
