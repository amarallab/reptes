//
//  Challenge.swift
//  Reptes
//
//  Created by Heliodoro Tejedor Navarro on 4/1/22.
//

import Foundation

public struct Challenge: Codable, Equatable {
    public var id: UUID
    public var card: ChallengeCard
    public var title: LocalizedText
    public var pages: [Page]
    
    public init(id: UUID, card: ChallengeCard, title: LocalizedText, pages: [Page]) {
        self.id = id
        self.card = card
        self.title = title
        self.pages = pages
    }
}

extension Challenge: Identifiable { }
