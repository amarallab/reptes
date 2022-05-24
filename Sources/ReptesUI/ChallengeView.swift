//
//  ChallengeView.swift
//  ReptesUI
//
//  Created by Heliodoro Tejedor Navarro on 5/24/22.
//

import Reptes
import SwiftUI

public typealias ChallengeView = BaseChallengeView<BasicBlockView>

struct ChallegeView_Previews: PreviewProvider {
    struct BlockMissing: Block, Codable, Equatable {
        public var id: UUID
    }
    
    static var missingBlockChallenge = Challenge(
        id: UUID(),
        card: .init(id: UUID()),
        title: .empty,
        pages: [
            .init(
                id: UUID(),
                title: "",
                blocks: [
                    BlockMissing(id: UUID()),
                    BlockImage.preview
                ]
            )
        ])

    static var previews: some View {
        ChallengeView(challenge: .preview)
        ChallengeView(challenge: missingBlockChallenge)
    }
}
