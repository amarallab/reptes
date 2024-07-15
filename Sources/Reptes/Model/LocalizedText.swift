//
//  LocalizedText.swift
//  Reptes
//
//  Created by Heliodoro Tejedor Navarro on 3/22/22.
//

import Foundation

public struct LocalizedText: Codable, Hashable, Equatable {
    public var values: [String: String] // Locale identifier: Text

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        values = try container.decode([String: String].self)
    }
    
    public init(values: [String: String]) {
        self.values = values
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(values)
    }
    
    public func text(for locale: Locale) -> String {
        let languageIdentifier = locale.languageCode ?? "en"
        return values[languageIdentifier] ?? ""
    }

    public func text(for localeIdentifier: String) -> String {
        values[localeIdentifier] ?? ""
    }
    
    public mutating func set(text: String, for locale: Locale) {
        let languageIdentifier = locale.languageCode ?? "en"
        values[languageIdentifier] = text
    }

    public mutating func set(text: String, for localeIdentifier: String) {
        values[localeIdentifier] = text
    }

}

extension LocalizedText {
    public static let empty = LocalizedText(values: [:])
}
