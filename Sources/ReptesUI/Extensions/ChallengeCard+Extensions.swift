//
//  File.swift
//  
//
//  Created by Heliodoro Tejedor Navarro on 6/2/22.
//

import Foundation
import Reptes
import UIKit

extension ChallengeCard {
    static public let previewTextFirst = ChallengeCard(
        id: UUID(),
        backgroundColor: .init(color: .green),
        foregroundColor: .init(color: .white),
        image: UIImage(named: "ForestMushroom", in: Bundle.module, with: nil),
        imageStyle: .textFirst,
        localizedTitle: .init(values: [
            "en": """
                  ## Title
                  Example text first
                  """
        ]))

    static public let previewTextLast = ChallengeCard(
        id: UUID(),
        backgroundColor: .init(color: .green),
        foregroundColor: .init(color: .white),
        image: UIImage(named: "ForestMushroom", in: Bundle.module, with: nil),
        imageStyle: .textLast,
        localizedTitle: .init(values: [
            "en": """
                  ## Title
                  Example text last
                  """
        ]))
}
