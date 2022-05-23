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
}
