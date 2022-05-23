//
//  ChallengeCard.swift
//  Reptes
//
//  Created by Heliodoro Tejedor Navarro on 3/22/22.
//

import Foundation
import UIKit

public struct ChallengeCard: Codable, Hashable, Identifiable, Equatable {
    public enum Style: String, Codable, Hashable {
        case textFirst
        case textLast
    }

    public let id: UUID
    public var backgroundColor: JSONColor?
    public var foregroundColor: JSONColor?
    public var image: UIImage?
    public var imageStyle: Style
    public var localizedTitle: LocalizedText
    
    enum CodingKeys: CodingKey {
        case id, backgroundColor, foregroundColor, image, imageStyle, localizedTitle
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(UUID.self, forKey: .id) ?? UUID()
        backgroundColor = try container.decodeIfPresent(JSONColor.self, forKey: .backgroundColor)
        foregroundColor = try container.decodeIfPresent(JSONColor.self, forKey: .foregroundColor)
        if let data = try container.decodeIfPresent(Data.self, forKey: .image) {
            guard let uiImage = UIImage(data: data) else { throw DecodingError.dataCorruptedError(forKey: .image, in: container, debugDescription: "Image format error") }
            image = uiImage
        }
        imageStyle = try container.decode(Style.self, forKey: .imageStyle)
        localizedTitle = try container.decode(LocalizedText.self, forKey: .localizedTitle)
    }
    
    public init(id: UUID, backgroundColor: JSONColor? = nil, foregroundColor: JSONColor? = nil, image: UIImage? = nil, imageStyle: Style = .textFirst, localizedTitle: LocalizedText = .empty) {
        self.id = id
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.image = image
        self.imageStyle = imageStyle
        self.localizedTitle = localizedTitle
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encodeIfPresent(backgroundColor, forKey: .backgroundColor)
        try container.encodeIfPresent(foregroundColor, forKey: .foregroundColor)
        if let image = image {
            guard
                let data = image.pngData()
            else {
                let context = EncodingError.Context(codingPath: encoder.codingPath, debugDescription: "Cannot create PNG Data")
                throw EncodingError.invalidValue(self, context)
            }
            try container.encode(data, forKey: .image)
        }
        try container.encode(imageStyle, forKey: .imageStyle)
        try container.encode(localizedTitle, forKey: .localizedTitle)
    }
}
